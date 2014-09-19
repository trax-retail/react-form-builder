/** @jsx React.DOM */
var FormWithPreview, React, Form;

Form = require("../index");
React = require('react');

FormWithPreview = React.createClass({
  propTypes: {
    formDef: React.PropTypes.object.isRequired
  },

  getInitialState: function() {
    return { preview: {} };
  },

  onChange: function(value) {
    this.setState({preview: JSON.stringify(value, undefined, 2)});
  },

  render: function() {
    return (
      <div className="row">
        <div className="col-md-6">
          <Form formDef={this.props.formDef} onChange={this.onChange} />
        </div>
        <div className="col-md-6">
          <div className="well">
            {this.state.preview}
          </div>
        </div>
      </div>
    );
  }
});

module.exports = FormWithPreview;