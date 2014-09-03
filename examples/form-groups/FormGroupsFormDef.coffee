FormGroupsFormDef =
  type: 'form'
  components: [
      type: 'form-group'
      title: 'ID'
      collapsable: true
      components: [
        {
          type: 'text-field'
          dataKey: 'firstName'
          displayName: 'First Name'
        }
        {
          type: 'text-field'
          dataKey: 'lastName'
          displayName: 'Last Name'
        }
        {
          type: 'date-field'
          dataKey: 'dob'
          displayName: 'Date of Birth'
        }
      ]
    ,
      type: 'form-group'
      title: 'Contact Information'
      collapsable: true
      components: [
          type: 'form-group'
          title: 'Old School'
          collapsable: true
          components: [
            {
              type: 'text-field'
              dataKey: 'address'
              displayName: 'Address'
            }
            {
              type: 'text-field'
              dataKey: 'city'
              displayName: 'City'
            }
            {
              type: 'number-field'
              dataKey: 'zipcode'
              displayName: 'Zip Code'
            }
          ]
        ,
          type: 'form-group'
          title: 'Cool kid'
          collapsable: true
          components: [
            {
              type: 'text-field'
              dataKey: 'email'
              displayName: 'Email'
            }
            {
              type: 'text-field'
              dataKey: 'twitter'
              displayName: 'Twitter'
            }
          ]
      ]
  ]

module.exports = FormGroupsFormDef