DateTimePickerFormDef =
  type: 'form'
  components: [
    {
      type: 'form-group'
      title: 'Date Time Picker'
      collapsable: false
      components: [
        {
          type: 'date-time-field'
          dataKey: 'datetime'
          displayName: 'Date Time Picker'
        }
      ]
    }
  ]

module.exports = DateTimePickerFormDef