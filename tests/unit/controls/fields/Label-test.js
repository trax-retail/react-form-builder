var __path__ = "../../../../src/fields/Label";

jest.dontMock(__path__);

describe('Label', function() {
  var React, TestUtils, FieldLabel, component, element;

  beforeEach(function() {
    React = require('react/addons')
    TestUtils = React.addons.TestUtils;
    FieldLabel = require(__path__);
  });

  it('renders an empty span when there is no name', function() {
    component = TestUtils.renderIntoDocument(
      <FieldLabel name={undefined}  dataKey={"first_name"} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'label');
    expect(element).toBeDefined();
    expect(element.props.children).toBeUndefined();
  });

  it("renders name when it is present", function() {
    component = TestUtils.renderIntoDocument(
      <FieldLabel name={"First Name"} dataKey={"first_name"} />
    );
    element = TestUtils.findRenderedDOMComponentWithTag(component, 'label');
    expect(element).toBeDefined();
    expect(element.props.children).toEqual("First Name");
    expect(element.props.htmlFor).toEqual("first_name");
  });

});