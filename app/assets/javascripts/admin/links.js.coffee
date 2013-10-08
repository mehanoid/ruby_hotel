$(document).on 'click', '[data-link]', ->
  Turbolinks.visit $(@).data('link')
