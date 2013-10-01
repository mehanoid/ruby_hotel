Допустим(/^существуют номера в категории "([^"]*)"$/) do |category|
  create(:room_category_with_rooms, name: category)
end

Если(/выбираю для бронирования категорию "([^"]*)"$/) do |category|
  within 'div.category', text: Regexp.new(category) do

  end
end
