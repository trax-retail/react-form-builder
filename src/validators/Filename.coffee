AbstractValidator = require('./Abstract')
isArray = require("lodash/isArray")
any = require("lodash/some")
toSentenceSerial = require("underscore.string/toSentenceSerial")

module.exports = class FilenameValidator extends AbstractValidator
  validate: (file, name) ->
    errors = []
    name ||= 'File'
    if suffix = @options.suffix
      suffixes = if isArray(suffix) then suffix else [suffix]
      list =
        if suffixes.length > 1
          toSentenceSerial(suffixes, ', ', ' or ')
        else
          suffixes

      unless any(suffixes, (suffix) -> file.name.match new RegExp("#{suffix}$", "i"))
        errors.push "#{name} must be a #{list} file."

    if errors.length > 0
      errors
    else
      null

