###* @jsx React.DOM ###

React = require 'react'
Controls = require('../../controls/Controls')
Containers = require('../Containers')

ParserMixin =
  propTypes:
    formDef: React.PropTypes.object.isRequired
    formData: React.PropTypes.oneOfType([
      React.PropTypes.object
      React.PropTypes.array
    ])
    title: React.PropTypes.string

  getDefaultProps: ->
    formDef: {}
    formData: {}

  getInitialState: ->
    if @props.formData
      formData: @props.formData
    else
      formData: {}

  constructFormFromDef: (def, base) ->
    def.components.map (def) =>
      type = def.type
      if type is undefined
        throw new Error('No form component type defined.')

      data = @resolveData(@generateDataKey(def.dataKey, base))

      switch type
        when 'form-group'             then return @formGroup           def, base
        when 'input-group'            then return @inputGroup          def, base
        when 'dynamic-def'            then return @dynamicDefinition   def, base
        when 'nested-form-group'      then return @nestedFormGroup     def, base
        when 'nested-field-group'     then return @nestedGroup    def, data, base
        when 'markdown-field'         then return @markdown       def, data, base
        when 'hidden-field'           then return @hidden         def, data, base
        when 'text-field'             then return @text           def, data, base
        when 'number-field'           then return @number         def, data, base
        when 'drop-down'              then return @dropDown            def, data, base
        when 'multiple-select'        then return @multipleSelect      def, data, base
        when 'date-field'             then return @date           def, data, base
        when 'date-time-field'        then return @dateTime       def, data, base #move to plugin
        when 'password-field'         then return @password       def, data, base
        when 'text-area'              then return @textArea            def, data, base
        when 'radio-buttons'          then return @radioButtons        def, data, base
        when 'checkbox'               then return @checkBox            def, data, base
        when 'file-select'            then return @file          def, data, base #move to plugin
        when 'type-ahead-field'       then return @typeAhead      def, data, base #move to plugin
        when 'multi-type-ahead-field' then return @multiTypeAhead def, data, base #move to plugin
        else throw new Error("Unknown form component #{type}")

  # containers
  formGroup: (def, base) ->
    dataKey = @generateDataKey(def.dataKey, base)

    Containers.Group
        dataKey       : dataKey
        formDef       : def
        title         : def.title
        formData      : @props.formData
        serverErrors  : @props.serverErrors
        submitting    : @props.submitting
        onDataChanged : @props.onDataChanged
        onEnter       : @props.onEnter
        key           : "#{def.type}-#{dataKey}"
      , @constructFormFromDef(def, base)


  inputGroup: (def, base) ->
    dataKey = @generateDataKey(def.dataKey, base)

    Containers.InputGroup
      dataKey       : @generateDataKey(dataKey, base)
      formDef       : def
      formData      : @props.formData
      serverErrors  : @props.serverErrors
      submitting    : @props.submitting
      onDataChanged : @props.onDataChanged
      onEnter       : @props.onEnter
      key           : "#{def.type}-#{dataKey}"
      leftComponent : if def.leftComponent then @constructFormFromDef(def.leftComponent, base) else null
      rightComponent : if def.rightComponent then @constructFormFromDef(def.rightComponent, base) else null
      mainComponent : if def.mainComponent then @constructFormFromDef(def.mainComponent, base) else null

  dynamicDefinition: (def, base) ->
    dataKey = @generateDataKey(def.dataKey, base)
    dynDef = @resolveData(dataKey)

    Controls.DynamicDefinition
      dataKey       : dataKey
      formDef       : def
      title         : def.title
      formData      : @props.formData
      serverErrors  : @props.serverErrors
      submitting    : @props.submitting
      onDataChanged : @props.onDataChanged
      onEnter       : @props.onEnter
      dataSources   : def.dataSources
      dependencies  : @parseDependencies(def)
    , if dynDef then @constructFormFromDef(dynDef, base) else null

  # components

  hidden: (def, data, base) ->
    Controls.Hidden @standardProps(def, data, base)

  text: (def, data, base) ->
    Controls.Text @standardProps(def, data, base)

  number: (def, data, base) ->
    Controls.Number @standardProps(def, data, base)

  date: (def, data, base) ->
    Controls.Date @standardProps(def, data, base)

  dateTime: (def, data, base) ->
    Controls.DateTime _.extend @standardProps(def, data, base),
      direction: def.direction

  password: (def, data, base) ->
    Controls.Password @standardProps(def, data, base)

  textArea: (def, data, base) ->
    Controls.TextArea _.extend @standardProps(def, data, base),
      rows: def.rows

  checkBox: (def, data, base) ->
    Controls.Checkbox @standardProps(def, data, base)

  markdown: (def, data, base) ->
    Controls.Markdown @standardProps(def, data, base)

  file: (def, data, base) ->
    Controls.File _.extend @standardProps(def, data, base),
      dragAndDrop  : def.dragAndDrop
      onFileSelect : def.onFileSelect

  dropDown: (def, data, base) ->
    Controls.Dropdown _.extend @standardProps(def, data, base),
      dataSources   : def.dataSources
      dependencies  : @parseDependencies(def)

  multipleSelect: (def, data, base) ->
    Controls.MultiSelect _.extend @standardProps(def, data, base),
      dataSources    : def.dataSources
      dependencies  : @parseDependencies(def)

  radioButtons: (def, data, base) ->
    Controls.RadioButtons _.extend @standardProps(def, data, base),
      boolean       : def.boolean
      dataSources   : def.dataSources
      dependencies  : @parseDependencies(def)

  typeAhead: (def, data, base) ->
    Controls.TypeAhead _.extend @standardProps(def, data, base),
      dataSources : def.dataSources
      dependencies: @parseDependencies(def)
      free: def.free

  multiTypeAhead: (def, data, base) ->
    Controls.MultiTypeAhead _.extend @standardProps(def, data, base),
      dataSources : def.dataSources
      dependencies: @parseDependencies(def)
      free: def.free

  nestedFormGroup: (def, data, base) ->

    dataKey = @generateDataKey(def.dataKey, base)

    Controls.NestedFormGroup
        dataKey       : dataKey
        formDef       : def
        formData      : @props.formData
        title         : def.title
        serverErrors  : @props.serverErrors
        submitting    : @props.submitting
        addNestedForm : @addNestedForm(dataKey)
        onDataChanged : @props.onDataChanged
        onEnter       : @props.onEnter
      , _.map @resolveData(dataKey), (data, nestedIndex) =>
          Containers.Group
              title            : def.nestedTitle
              dataKey          : "#{dataKey}[#{nestedIndex}]"
              formDef          : def.nestedFormDef ? def
              formData         : @props.formData
              serverErrors     : @props.serverErrors
              submitting       : @props.submitting
              onDataChanged    : @props.onDataChanged
              onEnter          : @props.onEnter
              removeNestedForm : @removeNestedForm(nestedIndex, dataKey)
            , @constructFormFromDef(def.nestedFormDef ? def, "#{dataKey}[#{nestedIndex}]")

  removeNestedForm: (nestedIndex, parentDataKey) ->
    #
    # Matches array properties:
    #   -> propertyName[indexName]
    #   [0] = "propertyName[indexName]"
    #   [1] = "propertyName"
    #   [2] = "indexName"
    #
    (dataKey) =>
      nestedIndex = dataKey.match(/^([a-zA-Z_]+)\[(\d)+\]$/)[2]
      newData = _.clone @resolveData(parentDataKey)
      newData.splice(nestedIndex, 1)
      @props.onDataChanged(parentDataKey, newData)

  addNestedForm: (dataKey) ->
    =>
      newData = _.clone @resolveData(dataKey)
      newData.push({})
      @props.onDataChanged(dataKey, newData)

  nestedGroup: (def, data, base) ->
    Controls.NestedGroup
      displayName   : def.displayName
      dataKey       : @generateDataKey(def.dataKey, base)
      formDef       : def
      formData      : @props.formData
      nestedType    : def.nestedType
      title         : def.title
      serverErrors  : @props.serverErrors
      submitting    : @props.submitting
      onDataChanged : @props.onDataChanged
      onEnter       : @props.onEnter
      key           : @generateDataKey(def.dataKey, base)
      data          : data ? []

  # helpers

  resolveData: (dataKey, data = @props.formData) ->
    return null unless dataKey
    parts = dataKey.split(".")
    for part in parts
      #
      # Matches array properties:
      #   -> propertyName[indexName]
      #   [0] = "propertyName[indexName]"
      #   [1] = "propertyName"
      #   [2] = "indexName"
      #
      results = part.match(/^([a-zA-Z_]*)\[(\d)+\]$/)
      if results
        data = data[results[1]] if results[1]
        data = data[results[2]] if results[2]
      else
        data = data[part]
    data

  generateDataKey: (dataKey, base = null) ->
    _.compact([base, dataKey]).join(".")

  parseDependencies: (def) ->
    _.tap {}, (dependencies) =>
      for name, dataSource of def.dataSources ? []
        _.each dataSource.dependentKeys ? [], (dataKey, i) =>
          if @props.formData[dataKey] isnt undefined
            dependencies[dataKey] = @props.formData[dataKey]

  standardProps: (def, data, base) ->
    key           : "#{def.type}-#{def.dataKey}"
    data          : data
    dataType      : def.dataType
    displayName   : def.displayName
    dataKey       : @generateDataKey(def.dataKey, base)
    serverErrors  : @props.serverErrors
    submitting    : @props.submitting
    placeholder   : def.placeholder
    title         : def.title
    validators    : def.validators
    onDataChanged : @props.onDataChanged
    onEnter       : @props.onEnter
    helpText      : def.helpText
    disabled      : def.disabled

module.exports = ParserMixin
