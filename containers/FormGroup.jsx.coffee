###* @jsx React.DOM ###

React = require('react/addons')
ReactBootstrap = require('react-bootstrap')

Group = React.createClass(

  propTypes:
    dataKey: React.PropTypes.string.isRequired
    formDef: React.PropTypes.object.isRequired
    title: React.PropTypes.string
    removeNestedForm: React.PropTypes.func

  getInitialState: ->
    collapsed: @props.formDef.collapsed ? false
    collapsable: @props.formDef.collapsable ? true

  toggleCollapse: (event) ->
    @setState collapsed: !@state.collapsed

  removeNestedForm: ->
    @props.removeNestedForm(@props.dataKey)

  renderHeader: ->
    if @props.title ? @props.removeNestedForm?
      `(
        <div className="panel-heading" onClick={this.state.collapsable ? this.toggleCollapse : ''}>
          <h3 className="panel-title">
            {this.props.title}
            &nbsp;
            {this.renderCollapsedIndicador()}
          </h3>
          {this.renderDeleteButton()}
        </div>
      )`

  renderCollapsedIndicador: ->
    if @state.collapsable
      if @state.collapsed
        `<ReactBootstrap.Glyphicon glyph="chevron-right" />`
      else
        `<ReactBootstrap.Glyphicon glyph="chevron-down" />`

  renderDeleteButton: ->
    if @props.removeNestedForm?
      `(
        <div className="pull-right panel-btns">
          <ReactBootstrap.Button onClick={this.removeNestedForm}><ReactBootstrap.Glyphicon glyph="remove" /></ReactBootstrap.Button>
        </div>
      )`

  render: ->
    classes = React.addons.classSet
      'panel-body': true
      'hidden': @state.collapsed

    `(
      <div className="panel panel-visible">
        {this.renderHeader()}
        <div className={classes}>
          {this.props.children}
        </div>
      </div>
    )`
)

module.exports = Group
