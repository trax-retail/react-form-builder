## Checkbox

Definitions:

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

Example:

```javascript
  {
    type: 'checkbox',
    dataKey: 'is_admin',
    displayName: 'Admin',
    helpText: 'Should this user be an admin ?'
  }
```

## Date Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'date-field',
    dataKey: 'date',
    displayName: 'Date of Birth'
  }
```

## Date Time Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'date-time-field',
    dataKey: 'arrival',
    displayName: 'Arrival time'
  }
```

## Dropdown Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**dataSources** | object | see dataSources documentation | no
**displayName** | string / boolean | label | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
    {
      type: 'drop-down',
      dataKey: 'city_id',
      displayName: 'City',
      dataSources: {
        options: {
            type: 'service',
            service: 'cityService.loadCities',
            adapter: 'abstractAdapter.genericDropDown'
        }
      }
    }
```

## File Select Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'file-select',
    dataKey: 'file',
    displayName: 'Attachment'
  }
```

## Hidden Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes

 Example:

```javascript
  {
    type: 'Hidden Field',
    dataKey: 'id'
  }
```

## Markdown Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'markdown-field',
    dataKey: 'description',
    displayName: 'Description'
  }
```

## Multiple Select

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**dataSources** | object | see dataSources documentation | no
**displayName** | string / boolean | label | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
    {
      type: 'multiple-select',
      dataKey: 'markets',
      displayName: 'Markets',
      dataSources: {
        options: {
          type: 'service',
          service: 'marketService.loadMarketsUnpaginated',
          adapter: 'abstractAdapter.genericDropDown'
        }
      }
    }
```

## Multi Typeahead

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**dataSources** | object | see dataSources documentation | no
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
    {
      type: 'multi-type-ahead-field',
      dataKey: 'retailers',
      displayName: 'Retailers',
      dataSources: {
        options: {
          type: 'service'
          dependentKeys: ['retailers_typeahead']
          args: ['${retailers_typeahead}']
          service: 'retailerService.searchByName'
          adapter: 'retailerAdapter.typeAhead'
        }
      }
    }
```

## Nested Field

insert documentation

## Number Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'number-field',
    dataKey: 'price',
    displayName: 'Price'
  }
```

## Password Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'password-field',
    dataKey: 'password',
    displayName: 'Password'
  }
```

## Radio buttons

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**dataSources** | object | see dataSources documentation | no
**displayName** | string / boolean | label | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'radio-buttons',
    dataKey: 'is_hidden',
    displayName: 'Is hidden?',
    dataSources: {
      options: {
        type: 'inline',
        data: [
          {
            displayName: 'Yes',
            value: 'true'
          },
          {
            displayName: 'No',
            value: 'false'
          }
        ]
      }
    }
  }
```

## Text Area

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'text-area',
    dataKey: 'description',
    displayName: 'Description'
  }
```

## Text Field

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
  {
    type: 'text-field',
    dataKey: 'name',
    displayName: 'Name'
  }
```

## Typeahead

Definitions :

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**dataSources** | object | see dataSources documentation | no
**displayName** | string / boolean | label | no
**placeholder** | string | html placeholder | no
**helpText** | string | block level help | no
**disabled** | boolean | defines whether the field is editable | no

 Example:

```javascript
    {
      type: 'type-ahead-field',
      dataKey: 'retailer',
      displayName: 'Retailer',
      dataSources: {
        options: {
          type: 'service',
          dependentKeys: ['retailer_typeahead'],
          args: ['${retailer_typeahead}'],
          service: 'retailerService.searchByName',
          adapter: 'retailerAdapter.typeAhead'
        }
      }
    }
```
