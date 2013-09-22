Допустим(/^я не залогинен$/) do
  visit destroy_user_session_path
end

Допустим(/^я зарегистрирован в системе$/) do
  @user = create(:user)
end
