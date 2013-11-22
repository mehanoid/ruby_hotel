$(document).on 'ready page:load', ->
  if $('body.accommodations').filter('.new, .create').length

    departureDatePicker = new ArrivalDepartureDatepicker('accommodation_departure')
    $category_id = $('select#accommodation_placements_attributes_0_room_category_id')

    do ->
      request = null

      updateDepartureDates = ->
        console.log 'update'
        request.abort() if request?
        category_id = $category_id.val()
        unless category_id
          departureDatePicker.updateDates()
        else
          request = $.getJSON Routes.available_departure_dates_room_category_path(category_id, arrival: Date.create('today')), (dates) ->
            console.log dates
            departureDatePicker.updateDates(dates)

      if $category_id.val()
        updateDepartureDates()

      $category_id.change(updateDepartureDates)
