React Form Builder provides a set of pre-built containers :

 - [Form](#form)
 - [Form Group](#form-group)
 - [Dynamic Defintion](#dynamic-definition)
 - [Input Group](#input-group)
 - [Nested Field Group](#nested-field-group)
 - [Nested Form Group](#nested-form-group)

## Form

Definitions:

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**title** | string | title | no
**components** | array | sub-components | no

Example:

```javascript
  {
    type: 'form',
    title: 'Log In',
    components: [
      {
        type: 'text-field',
        dataKey: 'email',
        displayName: 'Email'
      }
    ]
  }
```

## Form Group

Definitions:

Name       | Type      | Description | required
---------- | ----------|---------- | ----------
**type** | string | type definition | yes
**dataKey** | string | unique identifier | yes
**title** | string | title | no
**collapsable** | boolean | defines if that form group can be collapsed. true by default
**collapsed** | boolean | defines if that form group is collapsed. false by default
**components** | array | sub-components | no

Example:

```javascript
  {
    type: 'form',
    title: 'Log In',
    components: [
      {
        type: 'text-field',
        dataKey: 'email',
        displayName: 'Email'
      }
    ]
  }
```

# Dynamic Definition

insert doc here

# Input Group

Insert Doc

## Nested Field Group

insert documentation

## Nested Form Group

insert documentation