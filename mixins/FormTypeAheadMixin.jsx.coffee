###* @jsx React.DOM ###

KeyEvent = require '../../key_event'

TypeAheadMixin =
  getInitalState: ->
    lastOptions: []

  onChange: (value) ->
    # @validate value
    null

  onBlur: (event) ->
    if @props.free
      @props.onDataChanged(@props.dataKey, event.target.value)

    nextState =
      options: []
      lastOptions: @state.options
      hiddenList: true
      highlightedIndex: -1

    nextState.lastOptions = @state.options unless _.isEmpty(@state.options)
    @setState nextState


  onKeyDown: (event) ->
    code = event.keyCode
    if _.contains [KeyEvent.RETURN, KeyEvent.DOWN, KeyEvent.UP], code
      event.preventDefault()
      event.stopPropagation()

  onKeyUp: (event) ->
    code = event.keyCode

    switch code
      when KeyEvent.RETURN
        if @state.highlightedIndex >= 0
          # User hits enter on a selection from the dropdown
          @selectItem @state.options[@state.highlightedIndex]
        else if @state.options.length == 1
          # User hits enter in the box with only 1 matches
          @selectItem @state.options[0]
        else if @state.options.length == 0 and @state.lastOptions.length == 1
          # User gets down to 1 match, de-focuses the box, then hits Enter
          @selectItem @state.lastOptions[0]
      when KeyEvent.DOWN
        i = @state.highlightedIndex
        i += 1 if i < @state.options.length - 1
        @setState(highlightedIndex: i)
      when KeyEvent.UP
        i = @state.highlightedIndex
        i -= 1 if i > - 1
        @setState(highlightedIndex: i)
      when KeyEvent.ESCAPE
        @setState hiddenList: true
      when KeyEvent.PRINTABLE
        @setState hiddenList: false
      else
        @pendingStringChange = event.target.value
        @debouncedOnKeyUp()

    event.preventDefault()
    event.stopPropagation()

  debouncedOnKeyUp: _.debounce((->
    string = @pendingStringChange
    delete @pendingStringChange
    @setState(highlightedIndex: -1, options: [], hiddenList: false)
    dependencies = _.clone(@props.dependencies)
    dependencies["#{@props.dataKey}_typeahead"] = string
    @loadDataSource("options", dependencies)
  ), 100)


  formattedItem: ->
    if _.isObject(@state.item)
      @state.item
    else
      value: @state.item
      displayName: @state.item


  renderLabel: ->
    unless @props.displayName == false
      `(
        <label className="col-sm-2 control-label" htmlFor={this.props.dataKey}>{this.props.displayName}</label>
      )`

module.exports = TypeAheadMixin