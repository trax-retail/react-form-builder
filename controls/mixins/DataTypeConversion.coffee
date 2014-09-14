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
        if value == ""
          null
        else
          integer = parseInt(value, 10)
          if integer.toString() == value
            integer
          else
            value
      else
        if value == "" then null else value
module.exports = DataTypeConversionMixin