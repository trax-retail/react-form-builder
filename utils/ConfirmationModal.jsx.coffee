###* @jsx React.DOM ###

React = require('react/addons')
ReactBootstrap = require('react-bootstrap')

ConfirmationModal = React.createClass(
  propTypes:
    title      : React.PropTypes.string
    body       : React.PropTypes.oneOfType([React.PropTypes.string, React.PropTypes.component])
    accept     : React.PropTypes.func.isRequired
    cancel     : React.PropTypes.func.isRequired
    acceptText : React.PropTypes.string
    cancelText : React.PropTypes.string

  getDefaultProps: ->
    acceptText: "Of course I am"
    cancelText: "Nevermind"

  body: ->
    if @props.body?
      `(
        <p className="margin-bottom-lg">
          {this.props.body}
        </p>
      )`

  render: ->
    @transferPropsTo `(
      <ReactBootstrap.Modal title={this.props.title} onRequestHide={this.props.cancel}>
        <div className="modal-body">
          {this.body()}

          <div className="form-group text-center">
            <button
              type="button"
              className="btn btn-success btn-gradient margin-right-sm"
                onClick={this.props.accept}
            >
              <ReactBootstrap.Glyphicon glyph="check" />
              &nbsp;
              {this.props.acceptText}
            </button>

            <button
              type="button"
              className="btn btn-danger btn-gradient"
              onClick={this.props.cancel}
            >
              <ReactBootstrap.Glyphicon glyph="warning" />
              &nbsp;
              {this.props.cancelText}
            </button>
          </div>

        </div>
      </ReactBootstrap.Modal>
    )`
)

module.exports = ConfirmationModal