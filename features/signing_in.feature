Feature: Signing in to AdventuRegion to save adventures

  As an adventurer
  So that I can keep my favorite adventures
  I want to be able to log in and save my adventures to my profile

  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When the user submits invalid signin information
    Then the user should see the signin page again

  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
    Then I should see my profile page
      And the user should see a signout tab at navbar


  Scenario: Signing out
    Given a user visits the signin page
      And the user has an account
    When the user submits valid signin information
    Then I sign out