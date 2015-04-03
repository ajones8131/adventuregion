Feature: login to AdventuRegion to save adventures

  As an adventurer
  So that I can keep my favorite adventures
  I want to be able to log in and save my adventures to my profile

Scenario: Invalid Credentials Login
  Given a user visits the signin page
  When the user submits invalid signin credentials
  Then the user should see an error message

Scenario: Valid Credentials Login
  Given a user visits the signin page
  And the user has an account
  When the user submits valid signin credentials
  Then the user should see his or her profile page
  And the user should see a signout link