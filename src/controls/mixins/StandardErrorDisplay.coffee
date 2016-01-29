React = require('react')
classnames = require("classnames")
fromPairs = require("lodash/fromPairs")
map = require("lodash/map")
uniq = require("lodash/uniq")
select = require("lodash/filter")
capitalize = require("lodash/capitalize")

StandardErrorDisplayMixin =
  propTypes:
    dataKey: React.PropTypes.string.isRequired

  getInitialState: ->
    errors: []

  errorClasses: (list_of_classes...) ->
    class_list = fromPairs map(list_of_classes, (c) -> [c, true])
    class_list['has-error'] = @state.hasErrors

    classnames class_list

  # we need to be able to include validation errors
  componentWillReceiveProps: (nextProps) ->
    serverErrors = map(uniq(map(select(nextProps.serverErrors?.errors, (e) -> e.field == nextProps.dataKey), (serverError) -> serverError.message)), (message) -> capitalize(message))

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
