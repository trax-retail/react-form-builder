var __path__ = "../../../../src/fields/Errors";

jest.dontMock(__path__);

describe('Errors', function() {
  var React, TestUtils, FieldErrors, component, element;

  beforeEach(function() {
    React = require('react/addons')
    TestUtils = React.addons.TestUtils;
    FieldErrors = require(__path__);
  });

  it('renders an empty span when there are no errors', function() {
    component = TestUtils.renderIntoDocument(
      <FieldErrors errors={undefined} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'span');
    expect(element).toBeDefined();
    expect(element.props.children).toBeUndefined();
  });

  it("renders errors when they are present", function() {
    component = TestUtils.renderIntoDocument(
      <FieldErrors errors={["Invalid"]} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'span');
    expect(element).toBeDefined();
    expect(element.props.children).toEqual("Invalid");

  });

});