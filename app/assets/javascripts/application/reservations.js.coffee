$(document).on 'ready page:load', ->
  if $('body').filter('.new, .create').length

    $('div.datepicker.arrival').datepicker
      altField: '#reservation_arrival'
      defaultDate: $('#reservation_arrival').val()

    $('div.datepicker.departure').datepicker
      altField: '#reservation_departure'
      defaultDate: $('#reservation_departure').val()


    do ->
      request = null
      $('select#reservation_room_category_id').change ->
        request.abort() if request?
        category_id = $(@).val()
        return unless category_id
        request = $.getJSON Routes.available_arrival_dates_room_category_path(category_id), (data) ->
          console.log data
