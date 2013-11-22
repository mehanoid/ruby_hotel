$(document).on 'ready page:load', ->
  if $('body.reservations').filter('.new, .create').length

    arrivalDatePicker = new ArrivalDatepicker('reservation_arrival')
    departureDatePicker = new DepartureDatepicker('reservation_departure')
    $category_id = $('select#reservation_room_category_id')

    updateArrivalDates = ->
      arrivalDatePicker.update($category_id.val())

    updateArrivalDates()
    $category_id.change(updateArrivalDates)

    updateDepartureDates = ->
      departureDatePicker.update($category_id.val(), arrivalDatePicker.date())

    updateDepartureDates()
    arrivalDatePicker.change(updateDepartureDates)
    $category_id.change(updateDepartureDates)