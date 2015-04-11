
Given /^the following users exist:$/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^the user submits invalid signin credentials$/ do
  click_button("Sign in")
end

Then /^the user should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin credentials$/ do
	fill_in "Email",    with: @user.email, match: :first
	fill_in "Password", with: @user.password, match: :first
	click_button("Sign in")
end

Then /^the user should see his or her profile page$/ do
  expect(page).to have_title(@user.name)
end

Then /^the user should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

When /^the user press forgot password$/ do
  click_button("Forgot Password")
end

Given /^a user visits the forgot password page$/ do
  visit forgotpwd_path
end