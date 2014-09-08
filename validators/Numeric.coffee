AbstractValidator = require('./AbstractValidator')

module.exports = class NumericValidator extends AbstractValidator
  validate: (value, name) ->
    errors = []

    errors.push("#{name} must be numeric.") if isNaN(value)
    errors.push("#{name} cannot be more than #{@options.max}.") if @options.max? and (@options.max < value)
    errors.push("#{name} must be more than #{@options.min}.") if @options.min? and (@options.min > value)

    if errors.length > 0
      errors
    else
      null

