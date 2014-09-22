var FormDispatcher = require('../dispatchers/FormDispatcher');
var EventEmitter = require('events').EventEmitter;
var FormConstants = require('../constants/FormConstants');
var merge = require('react/lib/merge');
var _ = require('underscore');

var CHANGE_EVENT = 'change';

_errorsData = {};

function validateFormData(options) {
  var errors = _.reduce(options.validators, function(errors, validator) {
    var result = validator.validate(options.value);
    if(result) {
      errors.push(result);
    }
    return errors;
  }, []);

  return _errorsData[options.formId][options.dataKey] = errors.length > 0 ? errors : null;
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
      validateFormData({
        formId: payload.action.formId,
        dataKey: payload.action.dataKey,
        dataType: payload.action.dataType,
        value: payload.action.value,
        validators: payload.action.validators
      });
      break;

    default:
      return true;
  }

  FormDataStore.emitChange();

  return true; // No errors.  Needed by promise in Dispatcher.
});

module.exports = FormDataStore;