###* @jsx React.DOM ###

# Does not support cross cutting services dependencies thoughout the parent <-> nested form

React = require('react/addons')
ReactBootstrap = require('react-bootstrap')

NestedFormGroup = React.createClass(

  getInitialState: ->
    collapsed: @props.formDef.collapsed ? false
    collapsable: @props.formDef.collapsable ? true

  toggleCollapse: (event) ->
    @setState collapsed: !@state.collapsed

  renderHeader: ->
    if @props.title ? @props.nestedIndex?
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
    if @props.nestedIndex?
      `(
        <div className="pull-right panel-btns">
          <ReactBootstrap.Button onClick={this.props.removeNestedForm}><Icon type="imoon" name="remove2" /></ReactBootstrap.Button>
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
        <div className="panel-footer">
          <ReactBootstrap.Button onClick={this.props.addNestedForm}>Add an element</ReactBootstrap.Button>
        </div>
      </div>
    )`
)

module.exports = NestedFormGroup