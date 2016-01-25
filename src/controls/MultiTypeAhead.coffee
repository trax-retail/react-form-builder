React = require('react')
updateState = require "react-addons-update"
DataSourcedMixin = require('./mixins/DataSourced')
ValidationMixin = require('./mixins/Validation')
StandardErrorDisplayMixin = require('./mixins/StandardErrorDisplay')
DisableOnSubmitMixin = require('./mixins/DisableOnSubmit')
TypeAheadMixin = require('./TypeAhead/Mixin')
Matches = require('./TypeAhead/Matches')
Input = require('./TypeAhead/Input')
MultiTypeAheadLabel = require './TypeAhead/Label'
map = require("lodash/map")
any = require("lodash/some")
isEqual = require("lodash/isEqual")
difference = require("lodash/difference")


MultiTypeAheadField = React.createClass(
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
    item: {}
    items: []
    options: []
    clearCount: 0

  selectItem: (item) ->
    itemAlredyInList = any @state.items, (i) -> isEqual(i, item)

    update = updateState @state,
      options: {$set: []}
      hiddenList: {$set: true}
      highlightedIndex: {$set: -1}
      item: {$set: {}}
      items: {$push: if itemAlredyInList then [] else [item]}
      clearCount: {$set: @state.clearCount+1}

    @setState update, =>
      unless itemAlredyInList
        newItems = map(@state.items, (i) -> i.value)
        @props.onDataChanged(@props.dataKey, newItems)

  removeItem: (item) ->
    update = updateState @state,
      items: {$set: difference(@state.items, [item])}

    @setState update, =>
      newItems = map @state.items, (i) -> i.value
      @props.onDataChanged(@props.dataKey, newItems)

  renderLabels: ->
    map @state.items, (item) =>
      `<MultiTypeAheadLabel item={item} onClick={_this.removeItem} key={'label' + item.displayName} />`

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
            clearCount={this.state.clearCount}
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
          <div className="tag-container">
            {this.renderLabels()}
          </div>
        </div>
      </div>
    )`

)

module.exports = MultiTypeAheadField
