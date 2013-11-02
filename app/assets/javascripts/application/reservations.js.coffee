$(document).on 'ready page:load', ->
  if $('body').filter('.new, .create').length

    $('div.datepicker.arrival').datepicker
      altField: '#reservation_arrival'

    $('div.datepicker.departure').datepicker
      altField: '#reservation_departure'

    request = null

    $('select#reservation_room_category_id').change (event) ->
      request.abort() if request?
      category_id = $(@).val()
      return unless category_id
      request = $.getJSON Routes.available_arrival_dates_room_category_path(category_id), (data) ->
        console.log data
