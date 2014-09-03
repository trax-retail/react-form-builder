###* @jsx React.DOM ###

React = require('react/addons')
# to update

NestedField = React.createClass(
  # mixins: [Mixins.ParserMixin]

  propTypes:
    dataKey: React.PropTypes.string
    def: React.PropTypes.object.isRequired
    onDataChanged: React.PropTypes.func.isRequired
    onRemove: React.PropTypes.func.isRequired

  remove: ->
    @props.onRemove(@props.dataKey)

  # renderNestedForms: ->
  #   @constructFormFromDef(@props.def)

  render: ->
    `(
      <div className="row">
        <div className="col-md-10">
        </div>
        <div className="col-md-2">
          <Button onClick={this.remove}>
            <Icon name="remove_2" />
          </Button>
        </div>
      </div>
    )`
)

module.exports = NestedField