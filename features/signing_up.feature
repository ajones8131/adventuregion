Feature: Signing up for an account to AdventuRegion to save adventures

  As an adventurer
  So that I can keep my favorite adventures
  I want to be able to create an account to save my adventures to my profile

  Scenario: Successful signup
	Given I am on the home page
	Then show me the page
	When I click "Sign in"
	Then I should see a sign up link at bottom
	When I click "Sign up now!"
	Then I should see a signup form
	And I fill in "Name" with "Group3"
	And I fill in "Email" with "Group3@random.com"
	And I fill in "Password" with "foobar"
	And I fill in "user_password_confirmation" with "foobar"
	And I press "Create Account"
	Then I should see my newly created profile page

  Scenario: Unsuccessful signup	
  	Given I am on the home page
	When I click "Sign in"
	Then I should see a sign up link at bottom
	When I click "Sign up now!"
	Then I should see a signup form
	And I fill in "Name" with "Group9"
	And I fill in "Email" with "Group9@random.com"
	And I fill in "Password" with "nope"
	And I press "Create Account"
	Then I should see password is too short error message
	And I fill in "Name" with ""
	And I fill in "Email" with ""
	And I fill in "Password" with ""
	And I press "Create Account"
	Then I should see multiple errors
	Then the user should see the signup page again


