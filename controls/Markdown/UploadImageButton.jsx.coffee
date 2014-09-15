###* @jsx React.DOM ###

React = require "react"
ReactBootstrap = require "react-bootstrap"
FileSelect = require '../File'
utils = require '../../utils/utils'
ZeroClipboard = require 'react-zeroclipboard'

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

  renderOverlayContent: ->
    if @state.uploading
      `<div>Uploading ...</div>`
    else
      `(
        <input
          type="file"
          className="upload form-control"
          onChange={this.uploadFile}
        />
      )`

  renderOverlay: ->
    `(
      <ReactBootstrap.Popover
        title="Select file">
        {this.renderOverlayContent()}
      </ReactBootstrap.Popover>
    )`

  markdownImage: (resp) ->
    "![#{resp.url}](#{resp.url})"

  render: ->
    `(
      <ReactBootstrap.OverlayTrigger
        trigger="click"
        placement="left"
        overlay={this.renderOverlay()}
      >
        <ReactBootstrap.Button className="btn-xs btn-gradient">
          <ReactBootstrap.Glyphicon glyph="upload" />
        </ReactBootstrap.Button>
      </ReactBootstrap.OverlayTrigger>
    )`
)

module.exports = UploadImageButton