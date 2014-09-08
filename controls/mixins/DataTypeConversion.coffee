React = require 'react'

DataTypeConversionMixin =
  propTypes:
    dataType: React.PropTypes.string

  convertDataType: (value) ->
    switch @props.dataType
      when "boolean"
        switch value
          when "true", "1"
            true
          when "false", "0"
            false
          else
            null
      when "number"
        parseInt(value, 10)
      else
        value
module.exports = DataTypeConversionMixin