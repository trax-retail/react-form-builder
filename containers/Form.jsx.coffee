###* @jsx React.DOM ###

React = require('react/addons')
ParserMixin = require './mixins/Parser'
DisableOnSubmitMixin = require('../controls/mixins/DisableOnSubmit')

ButtonToolbar = require('react-bootstrap/ButtonToolbar')
Button = require('react-bootstrap/Button')

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
    React.addons.classSet
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