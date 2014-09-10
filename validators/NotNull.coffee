AbstractValidator = require('./Abstract')

module.exports = class NotNullValidator extends AbstractValidator
  validate: (value, name) ->
    null

