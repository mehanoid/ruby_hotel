$(document).on 'ready page:load', ->
  if $('body.reservations').filter('.new, .create').length

    arrivalDatePicker = new ArrivalDepartureDatepicker('reservation_arrival')
    departureDatePicker = new ArrivalDepartureDatepicker('reservation_departure')
    $category_id = $('select#reservation_room_category_id')

    do ->
      request = null

      updateArrivalDates = ->
        request.abort() if request?
        category_id = $category_id.val()
        unless category_id
          arrivalDatePicker.updateDates()
        else
          request = $.getJSON Routes.available_arrival_dates_room_category_path(category_id), (dates) ->
            arrivalDatePicker.updateDates(dates)

      if $category_id.val()
        updateArrivalDates()

      $category_id.change(updateArrivalDates)

    do ->
      request = null

      updateDepartureDates = (arrivalDate) ->
        request.abort() if request?
        category_id = $category_id.val()
        arrival = arrivalDatePicker.date()
        unless category_id and arrival
          departureDatePicker.updateDates()
        else
          request = $.getJSON Routes.available_departure_dates_room_category_path(category_id, arrival: arrival), (dates) ->
            departureDatePicker.updateDates(dates)

      if arrivalDatePicker.date()
        updateDepartureDates(arrivalDatePicker.date())

      arrivalDatePicker.change(updateDepartureDates)
      $category_id.change ->
        updateDepartureDates(arrivalDatePicker.date())
