var FormDispatcher = require('../dispatchers/FormDispatcher');
var EventEmitter = require('events').EventEmitter;
var FormConstants = require('../constants/FormConstants');
var merge = require('react/lib/merge');

var CHANGE_EVENT = 'change';

_errorsData = {};

function validateFormData(formId, dataKey, value, validators) {
  if(dataKey) {
    var errors = _.reduce(validators, function(errors, validator) {
      if(result = validator.validate(value)) {
        errors.push(result);
      }
      return errors;
    }, []);
    return _errorsData[formId][dataKey] = errors.length > 0 ? errors : null;
  }
  else {
    throw "Unexpected dataKey";
  }
};

var FormDataStore = merge(EventEmitter.prototype, {

  initialize: function(formId, errors) {
    if(errors === undefined) errors = {};
    return _errorsData[formId] = errors;
  },

  getErrorsData: function(formId) {
    return _errorsData[formId];
  },

  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback);
  }
});

// Register to handle all updates
FormDispatcher.register(function(payload) {
  var action = payload.action;

  switch(action.type) {
    case FormConstants.UPDATE_FORM_DATA:
      validateFormData(action.formId, action.dataKey, action.value, action.validators);
      break;

    default:
      return true;
  }

  FormDataStore.emitChange();

  return true; // No errors.  Needed by promise in Dispatcher.
});

module.exports = FormDataStore;