DisableOnSubmitMixin =

  disabled: ->
    if @props.disabled?
      if typeof @props.disabled == 'function'
        @props.disabled()
      else
        @props.disabled
    else
      @props.submitting && true

module.exports = DisableOnSubmitMixin