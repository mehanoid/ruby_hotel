Допустим(/^существует пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  @user = User.create(email: email, password: password)
end

Допустим(/не залогинен$/) do
  visit destroy_user_session_path
end

Допустим(/зашёл на страницу входа в систему$/) do
  visit admin_path
  click_on 'Login'
end