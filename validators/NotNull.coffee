AbstractValidator = require('./AbstractValidator')

module.exports = class NotNullValidator extends AbstractValidator
  validate: (value, name) ->
    null

