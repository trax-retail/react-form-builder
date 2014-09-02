###* @jsx React.DOM ###

React = require('react/addons')
Mixins = require('../mixins/Mixins')
CommonComponents = require('../../components')

FileSelect = React.createClass(
  mixins: [
    Mixins.SingleInputMixin,
    Mixins.ValidationMixin,
    Mixins.StandardErrorDisplayMixin,
    Mixins.DisableOnSubmitMixin,
    Mixins.HelpMixin
  ]

  propTypes:
    dataKey: React.PropTypes.string

  getInitialState: ->
    filename : @props.filename ? undefined
    dragging : false

  getDefaultProps: ->
    dragAndDrop : true

  onInputChange: (event) ->
    @fileWasSelected event.target.files[0] if event.target.files[0]

  onDragEnter: (event) ->
    return unless @props.dragAndDrop
    if event.dataTransfer.types?[0] == 'Files'
      @setState dragging: true

  onDragLeave: (event) ->
    return unless @props.dragAndDrop
    @setState dragging: false

  onDragOver: (event) ->
    event.preventDefault()

  onDrop: (event) ->
    return unless @props.dragAndDrop
    @setState dragging: false
    if event.dataTransfer.types?[0] == 'Files'
      @fileWasSelected event.dataTransfer.files[0]
    false

  filename: ->
    if @state.filename
      @state.filename
    else if @props.dragAndDrop
      'Select or drop a file here'

  fileWasSelected: (file) ->
    @setState
      filename : file.name

    @validate file, =>
      @props.onFileSelect?(file)

      if @props.onDataChanged
        @props.onDataChanged(@props.dataKey, file)

  render: ->
    classes = React.addons.classSet
      'col-sm-10' : true
      'fileDrop'  : @props.dragAndDrop

    dragIcon = CommonComponents.Icon name: 'cloud-upload', classes:
      'drag-target' : true
      dragging      : @state.dragging

    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false


    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div
          className={classes}
          onDragEnter={this.onDragEnter}
          onDragOver={this.onDragOver}
          onDragLeave={this.onDragLeave}
          onDrop={this.onDrop}
        >
          {dragIcon}
          <div className="fileUpload btn btn-info">
            <span>Choose File</span>
            <input
              ref="fileSelectInput"
              type="file"
              className="upload form-control"
              name={this.props.dataKey}
              onChange={this.onInputChange}
              data={this.filename()}
              disabled={this.disabled()}
              placeholder={this.props.placeholder}
              title={this.props.title}
            />
          </div>
          <span className="relative">{this.filename()}</span>
          {this.errorSpan()}
          {this.helpSpan()}
        </div>
       </div>
    )`
)

module.exports = FileSelect