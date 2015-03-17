React = require('react/addons')
Mixins = require('../controls/mixins/Mixins')

InputGroup = React.createClass(

  propTypes:
    formDef: React.PropTypes.object.isRequired
    leftComponent: React.PropTypes.object
    rightComponent: React.PropTypes.object
    mainComponent: React.PropTypes.object


  render: ->

    leftComponent = undefined
    if @props.formDef.leftComponent
      leftClass = @props.formDef.isLeftButton ? 'input-group-btn' : 'input-group-addon'
      leftForm = @props.leftComponent
      leftComponent =
        `
          <span className={leftClass}>
            {leftForm}
          </span>
        `

    rightComponent = undefined
    if @props.formDef.rightComponent
      rightClass = @props.formDef.isLeftButton ? 'input-group-btn' : 'input-group-addon'
      rightForm = @props.rightComponent
      rightComponent =
        `
          <span className={rightClass}>
            {rightForm}
          </span>
        `

    mainComponent = @props.mainComponent

    `(
      <div className="input-group">
        {leftComponent}
        {mainComponent}
        {rightComponent}
      </div>
    )`
)

module.exports = InputGroup