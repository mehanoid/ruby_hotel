$(document).on 'ready page:load', ->
  if $('body').filter('.new, .create').length

    canArrival = (availableDates = []) ->
      if availableDates.length
        (date) ->
          string = jQuery.datepicker.formatDate('yy-mm-dd', date)
          [ availableDates.indexOf(string) != -1 ]
      else -> false

    $arrival = $('div.datepicker.arrival')

    $arrival.datepicker
      altField: '#reservation_arrival'
      defaultDate: $('#reservation_arrival').val()
      beforeShowDay: canArrival([])


    $('div.datepicker.departure').datepicker
      altField: '#reservation_departure'
      defaultDate: $('#reservation_departure').val()

    do ->
      request = null
      $('select#reservation_room_category_id').change ->
        request.abort() if request?
        category_id = $(@).val()
        unless category_id
          $arrival.datepicker('option', 'beforeShowDay', canArrival([]))
        request = $.getJSON Routes.available_arrival_dates_room_category_path(category_id), (availableDates) ->
          $arrival.datepicker('option', 'beforeShowDay', canArrival(availableDates))
