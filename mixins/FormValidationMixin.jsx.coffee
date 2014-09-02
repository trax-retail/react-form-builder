###* @jsx React.DOM ###

#hack until I find the best way to replace these register functions
Validators = require('../validators/Validators')

ValidationMixin =
  getInitialState: ->
    validationErrors: []
    hasErrors: false

  componentDidMount: ->
    if @props.validators
      @loadValidators()

  loadValidators: ->
    @validators = _.map @props.validators, (options, name) =>
      # new window.validators[name](options)
      new Validators[name](options)

  validate: (value, callback) ->
    if @props.validators
      newErrors = _.map @validators, (validator) =>
        validator.validate value, @props.displayName

      # There is probably a better way to do this
      newErrors = _.flatten newErrors
      newErrors = _.without newErrors, null, undefined

      @setState
        validationErrors: newErrors
        hasErrors: (newErrors.length != 0)
        , callback()
    else
      callback() if callback

module.exports = ValidationMixin