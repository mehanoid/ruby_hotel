class Datepicker
  constructor: (field) ->
    @$datepicker = $("div.datepicker.#{field}")
    @$input = $("#reservation_#{field}")
    @datepicker
      altField: "#reservation_#{field}"
      defaultDate: @date()
      beforeShowDay: @canSelect([])

  date: ->
    @datepicker('getDate')

  updateDates: (dates) ->
    @datepicker('option', 'beforeShowDay', @canSelect(dates))

  #events
  change: (callback) ->
    @datepicker('option', 'onSelect', callback)

  #private
  datepicker: (args...) ->
    @$datepicker.datepicker(args...)

  canSelect: (dates = null) ->
    if dates? and dates.range_begin? and dates.range_begin?
      range = Date.range(new Date(dates.range_begin), new Date(dates.range_end))
      (date) =>
        unless range.contains(date)
          [false]
        else if dates.available_dates?.none(date.format('{yyyy}-{MM}-{dd}'))
          [ false, 'datepicker-no-free-rooms', 'нет свободных номеров' ]
        else
          [true]
    else ->
      [false]


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
