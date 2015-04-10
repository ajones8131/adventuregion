Feature: Signing in to AdventuRegion to save adventures

  As an adventurer
  So that I can keep my favorite adventures
  I want to be able to log in and save my adventures to my profile

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When they submit invalid signin information
    Then they should see an error message

  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
    Then they should see their profile page
      And they should see a signout link