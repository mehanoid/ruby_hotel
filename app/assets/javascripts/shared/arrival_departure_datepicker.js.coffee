class @ArrivalDepartureDatepicker
  constructor: (field) ->
    @_$datepicker = $("div.datepicker.#{field}")
    input_name = "##{field}"
    @_$input = $(input_name)
    @_datepicker
      altField: input_name
      defaultDate: @_$input.val()
      beforeShowDay: @_canSelect([])

  date: ->
    @_datepicker('getDate')

  updateDates: (dates) ->
    @_datepicker('option', 'beforeShowDay', @_canSelect(dates))

  #events
  change: (callback) ->
    @_datepicker('option', 'onSelect', callback)

  #private
  _datepicker: (args...) ->
    @_$datepicker.datepicker(args...)

  _canSelect: (dates = null) ->
    if dates? and dates.range_begin? and dates.range_begin?
      range = Date.range(Date.create(dates.range_begin), Date.create(dates.range_end))
      (date) =>
        unless range.contains(date)
          [false]
        else if dates.available_dates?.none(date.format('{yyyy}-{MM}-{dd}'))
          [ false, 'datepicker-no-free-rooms', 'нет свободных номеров' ]
        else
          [true]
    else ->
      [false]
