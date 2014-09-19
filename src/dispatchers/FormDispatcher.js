var Dispatcher = require('flux').Dispatcher;
var copyProperties = require('react/lib/copyProperties');

var FormDispatcher = copyProperties(new Dispatcher(), {

  handleViewAction: function(action) {
    this.dispatch({
      source: 'VIEW_ACTION',
      action: action
    });
  }

});

module.exports = FormDispatcher;