

Then /^I should see a sign up link at bottom$/ do
	expect(page).to have_content("New User? Sign up now!")
end

Then /^I should see a signup form$/ do
	expect(page).to have_content("Name")
	expect(page).to have_content("Email")
	expect(page).to have_content("Password")
	expect(page).to have_content("Confirm Password")
end

Then /^I should see my newly created profile page$/ do
	expect(page).to have_no_content('Log in')
	expect(page).to have_content('Sign Out')
end

Then /^I should see password is too short error message$/ do
  expect(page).to have_content("Password is too short (minimum is 6 characters)")
end

Then /^I should see multiple errors$/ do
	expect(page).to have_content("The form contains 6 errors.")
	expect(page).to have_content("Name can't be blank")
	expect(page).to have_content("Email can't be blank")
	expect(page).to have_content("Email is invalid")
	expect(page).to have_content("Password can't be blank")
  	expect(page).to have_content("Password is too short (minimum is 6 characters)")	
end

Then /^the user should see the signup page again$/ do
  expect(page).to have_content("Sign up")
end

Then /^I sign out$/ do
	visit('/signin')
end
