class Datepicker
  constructor: (field) ->
    @$datepicker = $("div.datepicker.#{field}")
    @$input = $("#reservation_#{field}")
    @datepicker
      altField: "#reservation_#{field}"
      defaultDate: @date()
      beforeShowDay: @canArrival([])

  date: ->
    @datepicker('getDate')

  updateDates: (dates) ->
    @datepicker('option', 'beforeShowDay', @canArrival(dates))

  #events
  change: (callback) ->
    @datepicker('option', 'onSelect', callback)

  #private
  datepicker: (args...) ->
    @$datepicker.datepicker(args...)

  canArrival: (availableDates = []) ->
    if availableDates.length
      (date) ->
        string = $.datepicker.formatDate('yy-mm-dd', date)
        [ availableDates.indexOf(string) != -1 ]
    else ->
      false


$(document).on 'ready page:load', ->
  if $('body').filter('.new, .create').length

    arrivalDatePicker = new Datepicker('arrival')
    departureDatePicker = new Datepicker('departure')
    $category_id = $('select#reservation_room_category_id')

    do ->
      request = null

      updateArrivalDates = ->
        request.abort() if request?
        category_id = $category_id.val()
        unless category_id
          arrivalDatePicker.updateDates([])
        else
          request = $.getJSON Routes.available_arrival_dates_room_category_path(category_id), (availableDates) ->
            arrivalDatePicker.updateDates(availableDates)

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
          departureDatePicker.updateDates([])
        else
          request = $.getJSON Routes.available_departure_dates_room_category_path(category_id, arrival: arrival), (availableDates) ->
            departureDatePicker.updateDates(availableDates)

      if arrivalDatePicker.date()
        updateDepartureDates(arrivalDatePicker.date())

      arrivalDatePicker.change(updateDepartureDates)
      $category_id.change ->
        updateDepartureDates(arrivalDatePicker.date())
