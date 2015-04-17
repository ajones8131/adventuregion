include ApplicationHelper

def sign_in(user)
	visit signin_path
    fill_in "Email",    with: @user.email, match: :first
    fill_in "Password", with: @user.password, match: :first
    click_button "Sign in"
end

def signout
	click_link "Sign Out"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end