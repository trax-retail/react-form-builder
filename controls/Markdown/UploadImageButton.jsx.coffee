###* @jsx React.DOM ###

React = require "react"
ReactBootstrap = require "react-bootstrap"
FileSelect = require '../File'
utils = require '../../utils/utils'
ZeroClipboard = require 'react-zeroclipboard'

UploadImageButton = React.createClass(
  propTypes:
    fileDestinationService: React.PropTypes.string.isRequired

  getInitialState: ->
    currentUrl: null

  reset: (e) ->
    e.preventDefault()
    @setState(currentUrl: null)

  uploadFile: (event) ->
    if file = event.target.files[0]
      utils.resolveService(@props.fileDestinationService, file,
        success: (resp) => @setState(currentUrl: resp.url)
        error: -> alert("error uploading")
      )

  renderOverlayContent: ->
    if @state.currentUrl
      `(
        <div>
          <ZeroClipboard getText={this.markdownImage()} getHtml={this.markdownImage()}>
            Click <a>here</a> to copy image markdown
          </ZeroClipboard>
          <small><a href='#' onClick={this.reset}>here</a> to upload new image</small>
        </div>
      )`
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

  markdownImage: ->
    "![#{@state.currentUrl}](#{@state.currentUrl})"

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