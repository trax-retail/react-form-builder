###* @jsx React.DOM ###

React = require 'react'
Controls = require('../controls/Controls')
Containers = require('../containers/Containers')

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
        when 'nested-field-group'     then return @nestedFieldGroup    def, data, base
        when 'markdown-field'         then return @markdownField       def, data, base
        when 'hidden-field'           then return @hiddenField         def, data, base
        when 'text-field'             then return @textField           def, data, base
        when 'number-field'           then return @numberField         def, data, base
        when 'drop-down'              then return @dropDown            def, data, base
        when 'multiple-select'        then return @multipleSelect      def, data, base
        when 'date-field'             then return @dateField           def, data, base
        when 'date-time-field'        then return @dateTimeField       def, data, base #move to plugin
        when 'password-field'         then return @passwordField       def, data, base
        when 'text-area'              then return @textArea            def, data, base
        when 'radio-buttons'          then return @radioButtons        def, data, base
        when 'checkbox'               then return @checkBox            def, data, base
        when 'file-select'            then return @fileSelect          def, data, base #move to plugin
        when 'type-ahead-field'       then return @typeAheadField      def, data, base #move to plugin
        when 'multi-type-ahead-field' then return @multiTypeAheadField def, data, base #move to plugin
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

  hiddenField: (def, data, base) ->
    Controls.HiddenField @standardProps(def, data, base)

  textField: (def, data, base) ->
    Controls.TextField @standardProps(def, data, base)

  numberField: (def, data, base) ->
    Controls.NumberField @standardProps(def, data, base)

  dateField: (def, data, base) ->
    Controls.DateField @standardProps(def, data, base)

  dateTimeField: (def, data, base) ->
    Controls.DateTimeField _.extend @standardProps(def, data, base),
      direction: def.direction

  passwordField: (def, data, base) ->
    Controls.PasswordField @standardProps(def, data, base)

  textArea: (def, data, base) ->
    Controls.TextArea _.extend @standardProps(def, data, base),
      rows: def.rows

  checkBox: (def, data, base) ->
    Controls.Checkbox @standardProps(def, data, base)

  markdownField: (def, data, base) ->
    Controls.MarkdownField @standardProps(def, data, base)

  fileSelect: (def, data, base) ->
    Controls.FileSelect _.extend @standardProps(def, data, base),
      dragAndDrop  : def.dragAndDrop
      onFileSelect : def.onFileSelect

  dropDown: (def, data, base) ->
    Controls.DropdownField _.extend @standardProps(def, data, base),
      dataSources   : def.dataSources
      dependencies  : @parseDependencies(def)

  multipleSelect: (def, data, base) ->
    Controls.MultipleSelect _.extend @standardProps(def, data, base),
      dataSources    : def.dataSources
      dependencies  : @parseDependencies(def)

  radioButtons: (def, data, base) ->
    Controls.RadioButtons _.extend @standardProps(def, data, base),
      boolean       : def.boolean
      dataSources   : def.dataSources
      dependencies  : @parseDependencies(def)

  typeAheadField: (def, data, base) ->
    Controls.TypeAheadField _.extend @standardProps(def, data, base),
      dataSources : def.dataSources
      dependencies: @parseDependencies(def)
      free: def.free

  multiTypeAheadField: (def, data, base) ->
    Controls.MultiTypeAheadField _.extend @standardProps(def, data, base),
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

  nestedFieldGroup: (def, data, base) ->
    Controls.NestedFieldGroup
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
