###* @jsx React.DOM ###

React = require('react/addons')

ReactBootstrap = require('react-bootstrap')
NestedField = require('./NestedField')
DisableOnSubmitMixin = require '../mixins/FormDisableOnSubmitMixin'
StandardErrorDisplayMixin = require '../mixins/FormStandardErrorDisplayMixin.jsx'

NestedFieldGroup = React.createClass(
  mixins: [
    DisableOnSubmitMixin
    StandardErrorDisplayMixin
  ]

  getDefaultProps: ->
    type: 'text-field'

  getInitialState: ->
    #
    # Hack to tell React when to update (or not) the nested dom elements.
    #
    # We can't have a common key for each of the nested fiels.
    #   - The array index isn't a good option.
    #     It becomes insconsistent when the array size changes.
    #     For example when an element is removed.
    #   - The value itself isn't a good option.
    #     It makes the input re-render always when the value changes.
    #     This makes the cursor move to the end of the input.
    #     If our basic form fields were stateful this would not happen.
    #
    # To deal with this, whenever the array size changes, we re-assign brand new indexes to the nested fields.
    #
    baseIndex: 0
    alternativeView: @props.type == 'text-field'

  componentDidUpdate: ->
    @setTextAreaHeight()

  componentDidMount: ->
    @setTextAreaHeight()

  componentWillReceiveProps: (nextProps) ->
    prevLength = @props.data.length
    nextLength = nextProps.data.length
    if prevLength != nextLength
      @setState(baseIndex: @state.baseIndex + prevLength)

  setTextAreaHeight: ->
    textarea = @refs.textarea
    if textarea
      node = textarea.getDOMNode()
      node.style.height = "#{node.scrollHeight}px"

  toggleView: ->
    @setState(alternativeView: !@state.alternativeView)

  add: ->
    newData = _.clone(@props.data)
    newData.push(null)
    @props.onDataChanged(@props.dataKey, newData)

  nestedFieldChanged: (dataKey, value) ->
    newData = _.clone(@props.data)
    newData[dataKey] = value
    @props.onDataChanged(@props.dataKey, newData)

  textAreaChanged: (event) ->
    newData = event.target.value.split(/\r?\n/)
    @props.onDataChanged(@props.dataKey, newData)

  remove: (dataKey) ->
    #
    # Matches array properties:
    #   -> propertyName[indexName]
    #   [0] = "propertyName[indexName]"
    #   [1] = "propertyName"
    #   [2] = "indexName"
    #
    newData = _.clone @props.data
    newData.splice(dataKey, 1)
    @props.onDataChanged(@props.dataKey, newData)

  renderToggleButton: ->
    if @props.type == 'text-field'
      iconName = if @props.alternativeView then "list" else "justify"
      `(
        <ReactBootstrap.Button onClick={this.toggleView} className="pull-left">
          <ReactBootstrap.Glyphcon glyph={iconName} />
        </ReactBootstrap.Button>
      )`

  renderMainView: ->
    `(
      <div>
        {this.renderNestedFields()}
        <div className="row">
          <div className="col-md-12">
            {this.renderToggleButton()}
            <ReactBootstrap.Button onClick={this.add} className="pull-right">
              <ReactBootstrap.Glyphcon glyph="plus" />
            </ReactBootstrap.Button>
          </div>
        </div>
      </div>
    )`

  renderNestedFields: ->
    _.map @props.data, (data, index) =>
      onEnter = if index == @props.data.length - 1 then @add else undefined
      key = "#{@props.dataKey}[#{@state.baseIndex+index}]"
      `(
        <NestedField
          key={key}
          displayName={false}
          type={_this.props.type}
          formData={_this.props.formData}
          data={data}
          dataKey={index}
          onDataChanged={_this.nestedFieldChanged}
          onEnter={onEnter}
          onRemove={_this.remove}
        />
      )`

  renderAlternativeView: ->
    `(
      <div>
        <div className="row">
          <div className="col-md-12">
            <div className="form-group textarea-nested-field">
              <textarea
                ref="textarea"
                className="form-control"
                name={this.props.dataKey}
                defaultValue={this.props.data.join("\n")}
                onChange={this.textAreaChanged}
                disabled={this.disabled()}
              />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-md-12">
            <span className="help-block pull-right">
              Write one per statement per line or change view
            </span>
            {this.renderToggleButton()}
          </div>
        </div>
      </div>
    )`

  renderView: ->
    if @state.alternativeView
      @renderAlternativeView()
    else
      @renderMainView()

  render: ->
    label = `(
      <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
    )` unless @props.displayName == false

    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
      <div className={this.errorClasses('form-group')}>
        {label}
        <div className={size}>
          {this.renderView()}
        </div>
      </div>
    )`
)

module.exports = NestedFieldGroup
