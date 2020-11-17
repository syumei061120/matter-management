module SignInSupport
  def sign_in(user)
    basic_pass new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on("ログイン")
  end
end