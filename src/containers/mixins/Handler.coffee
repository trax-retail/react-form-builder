React = require('react/addons')
_ = require('lodash')
Form = require '../Form'

HandlerMixin =
  #
  # Contract:
  #
  #   * Implement:
  #     onSubmit: (callback) ->
  #       ...
  #       callback()
  #

  propTypes:
    title:                React.PropTypes.string
    submitting:           React.PropTypes.bool
    serverErrors:         React.PropTypes.object
    formData:             React.PropTypes.object
    buttons:              React.PropTypes.object
    errorResponseHandler: React.PropTypes.object

  getInitialState: ->
    title            : @props.title        ? ""
    submitting       : @props.submitting   ? false
    serverErrors     : @props.serverErrors ? null
    formData         : @props.formData     ? {}
    formDef          : @props.formDef      ? {}
    buttons          : @bindButtons(@props.buttons ? @defaultButtons())

  componentWillReceiveProps: (nextProps) ->
    unless _.isEqual nextProps.formData, @props.formData
      if @isMounted()
        @setState(formData: nextProps.formData)

  defaultButtons: ->
    Save:   onClick: 'submitForm',  bsStyle: 'primary'
    Reset:  onClick: 'resetForm',   bsStyle: 'warning'
    Cancel: onClick: 'goBackHistory'

  bindButtons: (buttons) ->
    boundButtons = {}
    _.each buttons, (value, key) =>
      boundButtons[key] = _.extend _.clone(value), onClick: @[value.onClick]
    boundButtons

  setForm: (formData) ->
    if @isMounted()
      @setState
        formData         : formData
        submitting       : false

  submitForm: ->
    if @isMounted()
      @setState submitting: true, =>
        @onSubmit =>
          @setState submitting: false

  setServerErrors: (response) ->
    if response.status == 422
      if @isMounted()
        @setState serverErrors: response.body, submitting: false
    else
      if @isMounted()
        @setState(submitting: false)
        @props.errorResponseHandler.resolve(response)

  clearForm: ->
    if @isMounted()
      @setState formData: @props.formData, submitting: false

  resetForm: ->
    if @isMounted()
      @setState formData: @props.formData

  # meh
  goBackHistory: ->
    window.history.back()

  renderForm: (options = {}) ->
    form = `(
      <Form
        title={this.state.title}
        formDef={this.state.formDef}
        formData={this.state.formData}
        serverErrors={this.state.serverErrors}
        buttons={this.state.buttons}
        submitting={this.state.submitting || this.state.loading}
        onDataChanged={this.onDataChanged}
        onEnter={this.submitForm}
      />
    )`

    if _.isEmpty(options)
      form
    else
      React.addons.cloneWithProps form, options

  onDataChanged: (dataKey, value) ->
    if @isMounted()
      newData = _.clone @state.formData || {}

      datum = newData
      parts = dataKey.split(".")
      for part in parts
        #
        # Matches array properties:
        #   -> propertyName[indexName]
        #   [0] = "propertyName[indexName]"
        #   [1] = "propertyName"
        #   [2] = "indexName"
        #
        results = part.match(/^([a-zA-Z_]+)\[(\d)+\]$/)
        if part != parts[parts.length - 1]
          if results
            datum = datum[results[1]][results[2]]
          else
            datum = datum[part]
        else
          if results
            datum[results[1]][results[2]] =value
          else
            datum[part] = value

      @setState formData: newData


module.exports = HandlerMixin
