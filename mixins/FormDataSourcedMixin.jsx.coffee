###* @jsx React.DOM ###

React = require 'react'
_ = require('lodash')
_s = require('underscore.string')

#
# For each data source:
#   * sets a value on the state with "{dataSourceName}" as key
#   * sets a loading  on the state with "{dataSourceName}Loading" as key
#   * loadDataSource(name, props, )
#
DataSourcedMixin =
  propTypes:
    dataSources: React.PropTypes.object.isRequired

  getInitialState: ->
    _.tap {}, (state) =>
      for name, dataSource of @props.dataSources
        state[@loadingStateKey(name)] = false
        state[name] = dataSource.initial if 'initial' of dataSource

  componentDidMount: ->
    for name, dataSource of @props.dataSources
      @loadDataSource(name, @props.dependencies)

  componentWillReceiveProps: (nextProps) ->
    for name, dataSource of @props.dataSources
      if dataSource.dependentKeys? && dataSource.type is 'service'
        @loadDataSource(name, nextProps.dependencies)

  #
  # Public: Loads data for a dataSource
  #
  loadDataSource: (dataSourceName, dependencies) ->
    dataSource = @props.dataSources[dataSourceName]

    switch dataSource.type
      when 'service'
        missingDependencies = _.difference(dataSource.dependentKeys, _.keys(dependencies))

        if missingDependencies.length > 0
          return
        else
          @handleService dataSourceName, @tokenizeArgs(dependencies, dataSource.args ? [])
      when 'inline'
        @updateDataSource(dataSourceName, dataSource.data)
      else
        throw new Error("dataSource.type #{dataSource.type} is not a valid data source.")

  #
  # Updates data source
  #
  updateDataSource: (dataSourceName, data) ->
    update = {}
    update[dataSourceName] = @applyAdapter(@props.dataSources[dataSourceName], data)
    @setState(update)

  #
  # Loads a data source if all it's data dependencies have been met
  #
  handleService: (dataSourceName, args) ->
    dataSource = @props.dataSources[dataSourceName]

    @loadingDataSource dataSourceName, =>
      options =
        complete: => @doneLoadingDataSource(dataSourceName) if @isMounted()
        success: (resp) => @updateDataSource(dataSourceName, resp) if @isMounted()

      if args.length > 0
        Quri.NerveCenter.resolveService dataSource.service, args, options
      else
        Quri.NerveCenter.resolveService dataSource.service, options

  #
  # Each data source maps to a key and a loading key in the state
  #   e.g.: dataSource = { name: "options" }
  #         @state.options = []
  #         @state.loadingOptions = false
  #
  loadingStateKey: (dataSourceName) ->
    "loading" + _s.capitalize(dataSourceName)

  #
  # Set corresponding loading state for a data source
  #
  loadingDataSource: (dataSourceName, cb) ->
    update = {}
    update[@loadingStateKey(dataSourceName)] = true
    @setState(update, cb)

  #
  # Unset corresponding loading state for a data source

  doneLoadingDataSource: (dataSourceName) ->
    update = {}
    update[@loadingStateKey(dataSourceName)] = false
    @setState(update)

  #
  # Applies the adapter to the dataSource if any
  #
  applyAdapter: (dataSource, data) ->
    if dataSource.adapter
      Quri.NerveCenter.resolveAdapter(dataSource.adapter, data)
    else
      data

  ###
    This will loop through the service args list pulling out values that are of the form:
      ${dependent_key}
    and replacing them with the associated value for that dependent key. Ex:

      Data source in the form defintion:

        dataSources: {
          options {
            dependentKeys: ['customer_id', 'job_id', 'campaign_id']
            args: ['${campaign_id}', '${customer_id}', '${job_id}', 66]
            ...
          }
        }

      Dependencies hash passed into the component:

        {
          customer_id: 44,
          job_id: 123,
          campaign_id: 99
        }

      Results in the following args list:

        [99, 44, 123, 66]
  ###
  tokenizeArgs: (dependencies, args) ->
    tokenizedArgs = _.clone args
    _.each args, (argument, index) =>
      if typeof argument is 'string' and argument.substr(0, 2) == '${'
        key = argument.substr(2, argument.length - 3)
        tokenizedArgs[index] = dependencies[key]
      else
        tokenizedArgs[index] = argument

    tokenizedArgs

module.exports = DataSourcedMixin