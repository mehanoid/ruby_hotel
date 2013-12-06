Допустим(/^существует категория номеров "([^"]*)"$/) do |name|
  @category = create(:room_category, name: name)
end

Если(/ввожу диапазон номеров$/) do
  fill_in :rooms_form_number_range_start, with: 1
  fill_in :rooms_form_number_range_end, with: 3
end

Если(/^отмечаю первый номер в списке$/) do
  first('label.room input').set(true)
end