Допустим(/^существуют номера в категории "([^"]*)"$/) do |category|
  create(:room_category_with_rooms, name: category)
end

Если(/выбираю для бронирования категорию "([^"]*)"$/) do |category|
  within 'div.category', text: Regexp.new(category) do
    click_on 'Забронировать'
  end
end

Если(/выбираю дату заезда и дату выезда$/) do
  fill_in 'Дата заезда', with: '2013-10-01'
  fill_in 'Дата выезда', with: '2013-10-05'
end

Допустим(/^есть свободные номера за выбранный период$/) do
end

Допустим(/^нет свободных номеров за выбранный период$/) do
  Room.all.each do |room|
    room.reservations.create(arrival: '2013-10-01', departure: '2013-10-05')
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