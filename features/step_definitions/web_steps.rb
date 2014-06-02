Допустим(/зашёл на сайт отеля$/) do
  visit root_path
end

Если(/заполняю форму следующими данными:$/) do |table|
  table.hashes.each do |hash|
    field = hash['Поле']
    value = hash['Значение']
    begin
      fill_in field, with: value
    rescue
      select value, from: field
    end
  end
end

Если(/ввожу "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  fill_in field, with: value
end

Если(/ввожу в поле "([^"]*)" следующий текст:$/) do |field, text|
  fill_in field, with: text
end

Если(/выбираю "([^"]*)" в поле "([^"]*)"$/) do |option, field|
  select option, from: field
end

Если(/нажимаю кнопку "([^"]*)"$/) do |button|
  click_button button
end

Если(/нажимаю "([^"]*)"$/) do |clickable|
  click_on clickable
end

Если(/отвечаю "([^"]*)"$/) do |clickable|
  click_on clickable, exact: true
end

То(/должен увидеть "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

То(/не должен видеть "([^"]*)"$/) do |text|
  expect(page).not_to have_content text
end

То(/должен увидеть следующие сообщения об ошибках заполнения формы:$/) do |table|
  # table is a table.hashes.keys # => [:поле, :сообщение]
  table.hashes.each do |field|
    elem = find 'div.control-group', text: field['Поле']
    expect(elem).to have_content field['Сообщение']
  end
end