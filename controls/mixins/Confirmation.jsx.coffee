###* @jsx React.DOM ###

React = require('react/addons')
ConfirmationModal = require '../../utils/ConfirmationModal'

ConfirmationMixin =
  propTypes:
    confirmationTitle      : React.PropTypes.string
    confirmationBody       : React.PropTypes.oneOfType([React.PropTypes.string, React.PropTypes.component])
    confirmationAccept     : React.PropTypes.func
    confirmationAcceptText : React.PropTypes.string
    confirmationCancelText : React.PropTypes.string
    disabled               : React.PropTypes.bool

  getInitialState: ->
    isModalOpen    : false
    acceptCallback : @props.confirmationAccept

  showModal: ->
    unless @props.disabled
      @setState isModalOpen : true

  hideModal: ->
    @setState(isModalOpen: false)

  accept: ->
    @setState isModalOpen: false
    @state.acceptCallback()

  renderOverlay: ->
    if @state.isModalOpen
      `(
        <ConfirmationModal
          title={this.props.confirmationTitle}
          body={this.props.confirmationBody}
          accept={this.accept}
          cancel={this.hideModal}
          acceptText={this.props.confirmationAcceptText}
          cancelText={this.props.confirmationCancelText}
        />
      )`
    else
      `(<div />)`

module.exports = ConfirmationMixin