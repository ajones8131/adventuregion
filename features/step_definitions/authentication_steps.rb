
Given /^the following users exist:$/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end

Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^the user submits invalid signin information$/ do
  click_button("Sign in")
end

# Need Bootstrap for this - Use this in Iteration 4 when website overhaul is done
Then /^the user should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-error')
end

Then /^the user should see the signin page again$/ do
  expect(page).to have_content("Sign up now!") 
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
	fill_in "Email",    with: @user.email, match: :first
	fill_in "Password", with: @user.password, match: :first
	click_button("Sign in")
end

Then /^I should see my profile page$/ do
  expect(page).to have_content(@user.name)
  expect(page).to have_no_content('Log in')
  expect(page).to have_content('Sign Out')
end

Then /^the user should see a signout tab at navbar$/ do
  expect(page).to have_content('Sign Out')
end

When /^the user clicks forgot password button$/ do
  click_button("Forgot Password")
end

Given /^a user visits the forgot password page$/ do
  visit forgotpwd_path
end

Then /^ the user should see a forgot password form$/ do
  expect(page).to have_content('Forgot Your Password?')
  expect(page).to have_content('Please enter your Email Address')
end

