$(document).on 'ready page:load', ->
  $('form[method=get]:not([data-remote])').on 'submit', (event) ->
    event.preventDefault()
    Turbolinks.visit @.action + '?' + $(@).serialize()