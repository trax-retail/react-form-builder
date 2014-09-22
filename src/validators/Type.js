var AbstractValidator, TypeValidator;

AbstractValidator = require('./Abstract');

function TypeValidator(options) {
  AbstractValidator.call(this, options);
};

TypeValidator.prototype = Object.create(AbstractValidator);
TypeValidator.prototype.constructor = TypeValidator;
TypeValidator.prototype.validate = function(value) {
  var valid;
  switch(this.options.type) {
    case "boolean":
      valid = value === null || typeof(value) === "boolean";
      break;
    case "number":
      valid = value === null || typeof(value) === "number";
      break;
    case "integer":
      valid = value === null || (typeof(value) === "number" && value % 1 == 0);
      break;
    case "string":
      valid = value === null || typeof(value) === "string";
      break;
    default:
      throw("Unexpected dataType: '" + this.options.type + "'");
  }

  if(!valid) {
    return " is not a " + this.options.type + ".";
  }
};

module.exports = TypeValidator;