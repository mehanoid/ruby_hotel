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