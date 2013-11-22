$(document).on 'ready page:load', ->
  if $('body.accommodations').filter('.new, .create').length

    departureDatePicker = new DepartureDatepicker('accommodation_departure')
    $category_id = $('select#accommodation_placements_attributes_0_room_category_id')

    updateDepartureDates = ->
      departureDatePicker.update($category_id.val(), Date.create('today'))

    updateDepartureDates()
    $category_id.change(updateDepartureDates)
