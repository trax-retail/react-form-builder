var TypeConverter, React;

React = require('react');

function convertBoolean(value) {
   switch (value) {
      case "true":
      case "1":
        return true;
      case "false":
      case "0":
        return false;
      default:
        return null;
    }
}

function convertNumber(value) {
  if (value === "") {
    return null;
  } else {
    float = parseFloat(value, 10);
    if (float.toString() === value) {
      return float;
    } else {
      return value;
    }
  }
}

function convertInteger(value) {
  var integer;
  if (value === "") {
    return null;
  } else {
    integer = parseInt(value, 10);
    if (integer.toString() === value) {
      return integer;
    } else {
      return value;
    }
  }
}

function convertString(value) {
  if (value === "") {
    return null;
  } else {
    return value;
  }
}

TypeConverter = {
  propTypes: {
    dataType: React.PropTypes.string.isRequired
  },

  convertType: function(value) {
    switch (this.props.dataType) {
      case "boolean":
        return convertBoolean(value);
      case "number":
        return convertNumber(value);
      case "integer":
        return convertInteger(value);
      default:
        return convertString(value);
    }
  }
};

module.exports = TypeConverter;
