Если(/заполняю форму следующими данными:$/) do |table|
  table.hashes.each do |hash|
    fill_in hash['Поле'], with: hash['Значение']
  end
end

Если(/ввожу "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  fill_in field, with: value
end

Если(/ввожу в поле "([^"]*)" следующий текст:$/) do |field, text|
  fill_in field, with: text
end

Если(/нажимаю кнопку "([^"]*)"$/) do |button|
  click_button button
end

Если(/нажимаю "([^"]*)"$/) do |clickable|
  click_on clickable
end

То(/должен увидеть "([^"]*)"$/) do |text|
  page.should have_content text
end
