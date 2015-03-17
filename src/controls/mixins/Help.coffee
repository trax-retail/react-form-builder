React = require 'react'

HelpMixin =
  propTypes:
    dataKey: React.PropTypes.string.isRequired
    helpText: React.PropTypes.string

  helpSpan: ->
    if @props.helpText
      helpView =
        `
          <span className="help-block margin-top-sm">
            {this.props.helpText}
          </span>
        `

module.exports = HelpMixin