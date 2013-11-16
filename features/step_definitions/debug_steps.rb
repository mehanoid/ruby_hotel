When(/жду (.*) секунд$/) do |seconds|
  sleep seconds.to_i.seconds
end

When(/сохраняю страницу$/) do
  save_and_open_page
end