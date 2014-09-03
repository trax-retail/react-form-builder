BasicFormDef =
  type: 'form'
  components: [
    {
      type: 'form-group'
      title: 'Basic controls'
      collapsable: false
      components: [
        {
          type: 'text-field'
          dataKey: 'text'
          displayName: 'Text Field'
        }
        {
          type: 'date-field'
          dataKey: 'date'
          displayName: 'Date Field'
        }
        {
          type: 'checkbox'
          dataKey: 'checkbox'
          displayName: 'Checkbox'
        }
        {
          type: 'drop-down'
          displayName: 'Drop Down'
          dataKey: 'dropdown'
          dataSources: {
            options:
              type: 'inline'
              data: [
                displayName: 'Four Barrel'
                value: 'fourbarrel'
              ,
                displayName: 'Sightglass'
                value: 'sightglass'
              ,
                displayName: 'Ritual'
                value: 'ritual'
              ]
          }
        }
        {
          type: 'hidden-field'
          dataKey: 'hidden'
        }
        {
          type: 'multiple-select'
          dataKey: 'multiple'
          displayName: 'Multiple Select'
          dataSources: {
            options:
              type: 'inline'
              data: [
                displayName: 'Four Barrel'
                value: 'fourbarrel'
              ,
                displayName: 'Sightglass'
                value: 'sightglass'
              ,
                displayName: 'Ritual'
                value: 'ritual'
              ]
          }
          helpText: 'Hold command to select the different items.'
        }
        {
          type: 'number-field'
          dataKey: 'number'
          displayName: 'Number Field'
        }
        {
          type: 'password-field'
          dataKey: 'password'
          displayName: 'Password Field'
        }
        {
          type: 'radio-buttons'
          dataKey: 'radiobuttons'
          displayName: 'Radio Buttons'
          dataType: 'string'
          dataSources: {
            options:
              type: 'inline'
              data: [
                displayName: 'Four Barrel'
                value: 'fourbarrel'
              ,
                displayName: 'Sightglass'
                value: 'sightglass'
              ,
                displayName: 'Ritual'
                value: 'ritual'
              ]
          }
        }
        {
          type: 'text-area'
          dataKey: 'textarea'
          displayName: 'Text Area'
        },
      ]
    }
  ]

module.exports = BasicFormDef