map = require("lodash/map")
flatten = require("lodash/flatten")
without = require("lodash/without")

ValidationMixin =
  getInitialState: ->
    validationErrors: []
    hasErrors: false

  validate: (value, callback) ->
    if @props.validators
      newErrors = map @props.validators, (validator) =>
        validator.validate value, @props.displayName

      # There is probably a better way to do this
      newErrors = flatten newErrors
      newErrors = without newErrors, null, undefined

      @setState
        validationErrors: newErrors
        hasErrors: (newErrors.length != 0)
        , callback()
    else
      callback() if callback

module.exports = ValidationMixin
