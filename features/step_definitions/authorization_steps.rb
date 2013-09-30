module AuthorizationHelpers
  def password
    '12345678'
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Sign in"
  end
end
World(AuthorizationHelpers)

Допустим(/зашёл на главную страницу для сотрудников$/) do
  visit admin_root_path
end

Допустим(/^существует пользователь с email "([^"]*)" и паролем "([^"]*)"$/) do |email, password|
  @user = User.create(email: email, password: password)
end

Допустим(/не залогинен$/) do
  visit destroy_user_session_path
end

Допустим(/залогинен как (.*)$/) do |role|
  roles = {
      'администратор' => :admin,
      'менеджер по бронированию' => :reservation_manager
  }
  user = create(:admin, password: password, role: roles[role.strip])
  sign_in user
end