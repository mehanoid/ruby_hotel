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

Если(/выбираю для бронирования категорию "([^"]*)"$/) do |category|
  within 'div.category', text: Regexp.new(category) do
    click_on 'Забронировать'
  end
end

Если(/выбираю дату заезда и дату выезда$/) do
  fill_in 'Дата заезда', with: arrival
  fill_in 'Дата выезда', with: departure
end

Допустим(/^есть свободные номера за выбранный период$/) do
end

Допустим(/^нет свободных номеров за выбранный период$/) do
  Room.all.each do |room|
    create(:reservation, room: room, arrival: arrival, departure: departure)
  end
end

Допустим(/^существуют несколько броней$/) do
  create(:reservation)
end

Если(/^выбираю первую бронь в списке$/) do
  reservation = find('.reservation')
  @reservation_text = reservation.text
  find('.reservation').click
end

То(/^я не должен видеть аннулированную бронь в общем списке$/) do
  page.should_not have_content(@reservation_text)
end