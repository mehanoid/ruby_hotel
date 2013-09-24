Допустим(/^существует категория номеров "([^"]*)"$/) do |name|
  @category = create(:room_category, name: name)
end