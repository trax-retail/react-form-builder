React = require('react')
classnames = require("classnames")
ParserMixin = require './mixins/Parser'
DisableOnSubmitMixin = require('../controls/mixins/DisableOnSubmit')

{ButtonToolbar, Button} = require('react-bootstrap')

Form = React.createClass(
  mixins: [
    ParserMixin,
    DisableOnSubmitMixin
  ]

  propTypes:
    formDef        : React.PropTypes.object
    formData       : React.PropTypes.object
    title          : React.PropTypes.string # Title can also be set in formDef
    onEnter        : React.PropTypes.func # Callback when hitting Enter on an input
    buttons        : React.PropTypes.object

  classes: ->
    classnames
      "form-horizontal": true
      "component-submitting" : @props.submitting
      "component-not-submitting" : !@props.submitting

  buttons: ->
    _.map @props.buttons, (props, title) =>
      props.key = title
      props.disabled = @disabled()
      React.createFactory(Button) props, title

  render: ->
    `(
      <form role="form" className={this.classes()} onChange={this.onChange}>
        {this.constructFormFromDef(this.props.formDef)}
        <ButtonToolbar>{this.buttons()}</ButtonToolbar>
      </form>
    )`
)

module.exports = Form
