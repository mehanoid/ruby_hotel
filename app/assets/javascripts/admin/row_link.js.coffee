$(document).on 'ready page:load', ->
  $('tr.row-link').each (index, row) ->
    $row = $(row)
    $a = $row.find('a').first()
    href = $a.attr('href')
    $a.replaceWith($a.contents())
    $row.click ->
      Turbolinks.visit href
