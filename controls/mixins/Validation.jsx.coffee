###* @jsx React.DOM ###

ValidationMixin =
  getInitialState: ->
    validationErrors: []
    hasErrors: false

  componentDidMount: ->
    if @props.validators
      @loadValidators()

  loadValidators: ->
    @validators = _.map @props.validators, (options, name) =>
      new window.validators[name].constructor(options)

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