var __path__ = "../../../../src/fields/Help";

jest.dontMock(__path__);

describe('Help', function() {
  var React, TestUtils, FieldHelp, component, element;

  beforeEach(function() {
    React = require('react/addons')
    TestUtils = React.addons.TestUtils;
    FieldHelp = require(__path__);
  });

  it('renders an empty span when there is no text', function() {
    component = TestUtils.renderIntoDocument(
      <FieldHelp text={undefined} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'span');
    expect(element).toBeDefined();
    expect(element.props.children).toBeUndefined();
  });

  it("renders text when it is present", function() {
    component = TestUtils.renderIntoDocument(
      <FieldHelp text={"Write your name here"} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'span');
    expect(element).toBeDefined();
    expect(element.props.children).toEqual("Write your name here");

  });

});