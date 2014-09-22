var __path__ = "../../../src/controls/Text";

jest.dontMock(__path__);

describe('Text', function() {
  var React, TestUtils, TextControl, component, element;

  beforeEach(function() {
    React = require('react/addons')
    TestUtils = React.addons.TestUtils;
    TextControl = require(__path__);
    TypeConverter = require('../../../src/controls/mixins/TypeConverter');
  });

  it('renders an input field', function() {
    component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" validators={[]} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'input');
    expect(element).toBeDefined();
  });

  it("renders input field disabled when property disabled is true", function() {
   component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" disabled={true} />
    );
   expect(component.refs.input.getDOMNode().disabled).toBe(true);
  });

  it("renders input field disabled when property submitting is true", function() {
   component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" submitting={true} />
    );
   expect(component.refs.input.getDOMNode().disabled).toBe(true);
  });

  it("renders input field with the dataKey as name", function() {
   component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" />
    );
   expect(component.refs.input.getDOMNode().name).toEqual("name");
  });

  it("renders input field with the placeholder", function() {
   component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" placeholder="Write your name"/>
    );
   expect(component.refs.input.props.placeholder).toEqual("Write your name");
  });

  it("renders input field with the title", function() {
   component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" title="Name" />
    );
   expect(component.refs.input.getDOMNode().title).toEqual("Name");
  });

  it('triggers an updateFormData action with the correct arguments', function() {
    component = TestUtils.renderIntoDocument(
      <TextControl formId={123} dataKey="name" validators={[]} />
    );
    spyOn(FormActions, "updateFormData");
    spyOn(TypeConverter, "convertType").andReturn("Converted value");
    TestUtils.Simulate.change(component.refs.input.getDOMNode(), { target: { value: "Pol"}});
    expect(FormActions.updateFormData).toHaveBeenCalledWith(123, "name", "Pol", []);
  });

});