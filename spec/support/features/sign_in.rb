module Features
  def sign_in
    visit new_session_path
    fill_in "Email", with: "person@example.com"
    click_on "Sign In"
  end
end
