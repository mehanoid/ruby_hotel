Допустим(/^я не залогинен$/) do
  visit destroy_user_session_path
end

Допустим(/^я зарегистрирован в системе$/) do
  @user = create(:user)
end

Если(/^я захожу на страницу входа в систему$/) do
  visit admin_path
  click_on 'Login'
end

Если(/^я ввожу верные данные для входа$/) do
  pending
end