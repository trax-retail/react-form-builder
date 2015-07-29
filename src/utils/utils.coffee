utils = {

  # resolveService: (name, params...) ->
  #   parts = name.split('.')
  #   service = window.services[parts[0]]
  #
  #   if service
  #     method = service[parts[1]]
  #
  #     throw new Error("Unknown method #{parts[1]} on service #{parts[0]}. Perhaps you forgot to register the method?") if method == undefined
  #     method.apply(service, params)
  #   else
  #     throw new Error("Unknown service #{parts[0]}. Perhaps you forgot to register it?")
  #
  # resolveAdapter: (name, obj) ->
  #   parts = name.split('.')
  #   adapter = window.adapters[parts[0]]
  #
  #   if adapter
  #     method = adapter[parts[1]]
  #
  #     throw new Error("Unknown method #{parts[1]} on adapter #{parts[0]}. Perhaps you forgot to register the method?") if method == undefined
  #     return method.call(adapter, obj)
  #   else
  #     throw new Error("Unknown adapter #{parts[0]}. Perhaps you forgot to register it?")

}

module.exports = utils;
