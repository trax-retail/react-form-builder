AbstractValidator = require('./AbstractValidator')
_ = require('lodash')

module.exports = class FilenameValidator extends AbstractValidator
  validate: (file, name) ->
    errors = []
    name ||= 'File'
    if suffix = @options.suffix
      suffixes = if _.isArray(suffix) then suffix else [suffix]
      list =
        if suffixes.length > 1
          _.toSentenceSerial(suffixes, ', ', ' or ')
        else
          suffixes

      unless _.any(suffixes, (suffix) -> file.name.match new RegExp("#{suffix}$", "i"))
        errors.push "#{name} must be a #{list} file."

    if errors.length > 0
      errors
    else
      null

