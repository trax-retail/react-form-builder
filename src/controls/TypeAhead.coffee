React = require('react/addons')
DataSourcedMixin = require('./mixins/DataSourced')
ValidationMixin = require('./mixins/Validation')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
TypeAheadMixin = require('./TypeAhead/Mixin')
Matches = require('./TypeAhead/Matches')
Input = require('./TypeAhead/Input')

TypeAheadField = React.createClass(
  mixins: [
    DataSourcedMixin
    ValidationMixin
    StandardErrorDisplayMixin
    DisableOnSubmitMixin
    TypeAheadMixin
  ]

  propTypes:
    displayName: React.PropTypes.oneOfType([
      React.PropTypes.string, # Actual name
      React.PropTypes.bool    # false to disable
    ])
    dataKey: React.PropTypes.string.isRequired

  getInitialState: ->
    hiddenList: true
    highlightedIndex: -1
    item: @props.data ? {}
    options: []

  onChange: (value) ->
    if value == null
      @props.onDataChanged(@props.dataKey, null)

  selectItem: (item) ->
    update =
      options: []
      hiddenList: true
      highlightedIndex: -1
      item: item

    @setState update, =>
      value = item.value ? (if typeof item == "string" then item else undefined)
      @props.onDataChanged(@props.dataKey, value)

  componentWillReceiveProps: (nextProps) ->
    unless (nextProps.data == @state.item.value) || (nextProps.data == @state.item)
      @selectItem({})

  render: ->
    size = if @props.displayName == false then 'col-sm-12' else 'col-sm-10'

    `(
      <div className={this.errorClasses('form-group', 'has-feedback')}>
        {this.renderLabel()}
        <div className={size}>
          <Input
            dataKey={this.props.dataKey}
            emptyList={this.state.hiddenList || this.state.options.length == 0}
            item={this.formattedItem()}
            free={this.props.free}
            disabled={this.disabled() || this.state.loadingItem}
            placeholder={this.props.placeholder}
            title={this.props.title}
            loading={this.state.loadingOptions || this.state.loadingItem}
            onChange={this.onChange}
            onFocus={this.onFocus}
            onBlur={this.onBlur}
            onKeyDown={this.onKeyDown}
            onKeyUp={this.onKeyUp}
          >
            <Matches
              ref="list"
              matches={this.state.options}
              highlightedIndex={this.state.highlightedIndex}
              hidden={this.state.hiddenList}
              onSelect={this.selectItem}
            />
            {this.errorSpan()}
          </Input>
        </div>
      </div>
    )`

)

module.exports = TypeAheadField
