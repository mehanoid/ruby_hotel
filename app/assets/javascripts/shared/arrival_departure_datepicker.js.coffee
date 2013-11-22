class Datepicker
  constructor: (field) ->
    @_$datepicker = $("div.datepicker.#{field}")
    input_name = "##{field}"
    $input = $(input_name)
    @_datepicker
      altField: input_name
      defaultDate: $input.val()
      beforeShowDay: @_canSelect([])

  date: ->
    @_datepicker('getDate')

  #events
  change: (callback) ->
    @_datepicker('option', 'onSelect', callback)

  #private
  _datepicker: (args...) ->
    @_$datepicker.datepicker(args...)

  _setDates: (dates = null) ->
    @_datepicker('option', 'beforeShowDay', @_canSelect(dates))

  _updateDates: (url = null) ->
    @_request.abort() if @_request?
    unless url?
      @_setDates()
    else
      @_request = $.getJSON url, (dates) =>
        @_setDates(dates)

  _canSelect: (dates = null) ->
    if dates? and dates.range_begin? and dates.range_begin?
      range = Date.range(Date.create(dates.range_begin), Date.create(dates.range_end))
      (date) ->
        unless range.contains(date)
          [false]
        else if dates.available_dates?.none(date.format('{yyyy}-{MM}-{dd}'))
          [ false, 'datepicker-no-free-rooms', 'нет свободных номеров' ]
        else
          [true]
    else ->
      [false]

class @ArrivalDatepicker extends Datepicker
  update: (category_id) ->
    url = if category_id
      Routes.available_arrival_dates_room_category_path(category_id)
    @_updateDates url

class @DepartureDatepicker extends Datepicker
  update: (category_id, arrival) ->
    url = if category_id and arrival
      Routes.available_departure_dates_room_category_path(category_id, arrival: arrival)
    @_updateDates url