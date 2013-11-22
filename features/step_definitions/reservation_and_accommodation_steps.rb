module ReservationHelpers
  def arrival
    '02.10.2013'
  end

  def departure
    '05.10.2013'
  end
end
World(ReservationHelpers)

Допустим(/^существуют номера в категории "([^"]*)"$/) do |category|
  create(:room_category_with_rooms, name: category)
end

Если(/выбираю дату заезда и дату выезда$/) do
  find('#reservation_arrival').set(arrival)
  find('#reservation_departure').set(departure)
end

Если(/выбираю дату выезда$/) do
  find('#accommodation_placements_attributes_0_departure').set(departure)
end

Допустим(/^есть свободные номера за выбранный период$/) do
end

Допустим(/^нет свободных номеров за выбранный период$/) do
  Room.all.each do |room|
    create(:reservation, room: room, arrival: arrival, departure: departure)
  end
end

Допустим(/^существуют несколько броней$/) do
  2.times { create(:reservation) }
end

Допустим (/^в отеле проживают несколько клиентов$/) do
  2.times { create(:accommodation) }
  #create(:accommodation)
end

Если(/выбираю первую бронь в списке$/) do
  within 'table' do
    reservation = first('.reservation')
    @reservation_text = reservation.text
    first('.reservation a').click
  end
end

Если(/выбираю первого проживающего клиента в списке$/) do
  within 'table' do
    first('.accommodation a').click
  end
end

То(/^я не должен видеть аннулированную бронь в общем списке$/) do
  page.should_not have_content(@reservation_text)
end
