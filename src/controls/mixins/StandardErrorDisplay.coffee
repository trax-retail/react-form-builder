React = require('react')
classnames = require("classnames")
_ = require('lodash')

StandardErrorDisplayMixin =
  propTypes:
    dataKey: React.PropTypes.string.isRequired

  getInitialState: ->
    errors: []

  errorClasses: (list_of_classes...) ->
    class_list = _.object _.map(list_of_classes, (c) -> [c, true])
    class_list['has-error'] = @state.hasErrors

    classnames class_list

  # we need to be able to include validation errors
  componentWillReceiveProps: (nextProps) ->
    serverErrors = _.chain(nextProps.serverErrors?.errors)
              .select((e) -> e.field == nextProps.dataKey)
              .map((serverError) -> serverError.message)
              .uniq()
              .map((message) -> _.capitalize(message))
              .value()

    errors = if @state.validationErrors?.length > 0 then @state.validationErrors else serverErrors
    if errors.length > 0
      @setState
        hasErrors: true
        errors: errors
    else
      @setState
        hasErrors: false
        errors: []

  errorSpan: ->
    if @state.hasErrors
      errorView =
        `
          <span className="help-block">
              {this.state.errors.join(', ')}
          </span>
        `

module.exports = StandardErrorDisplayMixin
