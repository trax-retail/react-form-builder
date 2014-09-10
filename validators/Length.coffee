AbstractValidator = require('./Abstract')

module.exports = class LengthValidator extends AbstractValidator
  validate: (value, name) ->
    errors = []

    errors.push("#{name} cannot be more than #{@options.max} characters.") if @options.max and (@options.max < value.length)
    errors.push("#{name} must be more than #{@options.min} characters.") if @options.min and (@options.min > value.length)

    if errors.length > 0
      errors
    else
      null

