###* @jsx React.DOM ###

React = require "react"
ReactBootstrap = require "react-bootstrap"
FileSelect = require '../File'
utils = require '../../utils/utils'

UploadImageButton = React.createClass(
  propTypes:
    fileDestinationService: React.PropTypes.string.isRequired
    addImageMarkdown: React.PropTypes.func.isRequired

  getInitialState: ->
    uploading: false

  uploadFile: (event) ->
    if file = event.target.files[0]
      @setState uploading: true, =>
        utils.resolveService(@props.fileDestinationService, file,
          complete: => @setState(uploading: false)
          error: => alert("error uploading")
          success: (resp) => @props.addImageMarkdown(@markdownImage(resp))
        )

  markdownImage: (resp) ->
    "![#{resp.url}](#{resp.url})"

  openFilePrompt: ->
    @refs.input.getDOMNode().click()

  render: ->
    if @state.uploading
      `(
        <ReactBootstrap.Button disabled={true} className="btn-xs btn-gradient">
          <ReactBootstrap.Glyphicon glyph="refresh" />
        </ReactBootstrap.Button>
      )`

    else
      `(
        <div>
          <ReactBootstrap.Button onClick={this.openFilePrompt} className="btn-xs btn-gradient">
            <ReactBootstrap.Glyphicon glyph="upload" />
          </ReactBootstrap.Button>
          <div style={{display: "none"}}>
            <input
              ref="input"
              type="file"
              className="upload form-control"
              onChange={this.uploadFile}
            />
          </div>
        </div>
    )`
)

module.exports = UploadImageButton