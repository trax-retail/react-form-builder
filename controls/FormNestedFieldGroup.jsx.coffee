###* @jsx React.DOM ###

React = require('react/addons')
Mixins = require('../mixins/Mixins')
Controls = require('./Controls')

NestedFieldGroup = React.createClass(
  mixins: [Mixins.ParserMixin]


  propTypes:
    dataKey: React.PropTypes.string
    formData: React.PropTypes.object

  getDefaultProps: ->
    fieldDef:
      components: [
        # displayName: @props.displayName
        # type: @props.nestedType
      ]

  add: ->
    newData = _.clone @resolveData(@props.dataKey)
    newData.push(null)
    @props.onDataChanged(@props.dataKey, newData)

  removeField: (dataKey) ->
    #
    # Matches array properties:
    #   -> propertyName[indexName]
    #   [0] = "propertyName[indexName]"
    #   [1] = "propertyName"
    #   [2] = "indexName"
    #
    nestedIndex = dataKey.match(/^([a-zA-Z_]+)\[(\d)+\]$/)[2]
    newData = _.clone @resolveData(@props.dataKey)
    newData.splice(nestedIndex, 1)
    @props.onDataChanged(@props.dataKey, newData)

  renderNestedFields: ->
    _.map @resolveData(@props.dataKey), (data, index) =>
      `(
        <Controls.NestedField
          formData={_this.props.formData}
          dataKey={_this.props.dataKey+"["+index+"]"}
          def={_this.props.fieldDef}
          onDataChanged={_this.props.onDataChanged}
          onRemove={_this.removeField}
        />
      )`

  render: ->
    `(
      <div>
        {this.renderNestedFields()}
        <div className="row">
          <div className="col-md-10">
          </div>
          <div className="col-md-2">
            <Button onClick={this.add}>
              <Icon type="glyphicon" name="plus" />
            </Button>
          </div>
        </div>
      </div>
    )`
)

module.exports = NestedFieldGroup