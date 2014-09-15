Data Source objects provide information about the way to fetch options for Controls such as Dropdown / Multiple Select (the select's options), Typeahead / Multi Typeahead (where should we look for suggestion), Radio Buttons.

Value properties :

Name | Type | Description | Required
---- | ---- | ---- | ----
**type** | string | The Data Source type, can be either **inline** or **service** | Yes
**data** | array | The plain inlined data | If type is inline
**service** | string | References the service and function to call to fetch the data | if type is service
**adapter** | string | References the adapter and function to call to decorate the data | if type is service
**dependentKeys** | array of strings | If this field options is dependending on another field's value, specify it here. | No
**args** | array of strings | Specify the arguments the service will be called with | No

A Data Source object can reference *inline* options :

```javascript
{
  options: {
    type: 'inline',
    data: [
      {
        displayName: 'Four Barrel'
        value: 'fourbarrel'
      },
      {
        displayName: 'Sightglass'
        value: 'sightglass'
      },
      {
        displayName: 'Ritual'
        value: 'ritual'
      }
    ]
  }
}
```

but it can also reference an external *service* :

```javascript
{
  options: {
    type: 'service',
    dependentKeys: ['city_id'],
    service: 'cityService.loadNeighborhoodsWithCityId',
    args: ['${city_id}'],
    adapter: 'abstractAdapter.genericDropDown'
  }
}
```