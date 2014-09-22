module.exports = {
  basic: {
    title: "Basic Form",
    components: [
      {
        name: 'First Name',
        type: TextControl,
        dataKey: 'first-name',
        helpText: 'Enter your first name here',
        validators: [
          {
            validate: function(value) {
              if(value != "Pol") { return "This is not Pol"; }
            }
          }
        ]
      },
      {
        name: 'Last Name',
        type: TextControl,
        dataKey: 'last-name',
        helpText: 'Enter your last name here'
      },
      {
        name: 'Age',
        type: TextControl,
        dataKey: 'age',
        dataType: 'integer',
        helpText: 'Enter your age here'
      },
      {
        name: 'Gender',
        type: TextControl,
        dataKey: 'gender',
        disabled: true
      }
    ]
  }
};
