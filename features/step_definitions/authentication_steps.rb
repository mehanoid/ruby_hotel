def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user[:email]
  fill_in "Password", with: user[:password]
  click_button "Sign in"
end

Допустим(/зашёл на страницу входа в систему$/) do
  visit admin_path
  click_on 'Login'
end

Допустим(/^существует пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  @user = User.create(email: email, password: password)
end

Допустим(/не залогинен$/) do
  visit destroy_user_session_path
end

Допустим (/залогинен как администратор$/) do
  user = { email: 'admin@example.com', password: '12345678' }
  User.create(user)
  sign_in user
end