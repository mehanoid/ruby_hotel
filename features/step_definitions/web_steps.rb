Если(/заполняю форму следующими данными:$/) do |table|
  table.hashes.each do |hash|
    fill_in hash['Поле'], with: hash['Значение']
  end
end

Если(/нажимаю кнопку "([^"]*)"$/) do |button|
  click_button button
end

То(/должен увидеть "([^"]*)"$/) do |text|
  page.should have_content text
end