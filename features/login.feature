Feature: login to AdventuRegion to save adventures

  As an adventurer
  So that I can keep my favorite adventures
  I want to be able to log in and save my adventures to my profile

# Oh god why
Background: users have been added to the database

  Given the following users exist:
  | username    | password      |
  | shirley65   | 12345         |
  | benton26    | hunter2       |
  | donnieb     | qwerty        |
  | H4x0r       | E-13E7^hAxor  |
  | john.smith2 | 0xbeef        |

  And I am on the login page

Scenario: correct login
  When I fill in "username" with "shirley65"
  And I fill in "password" with "12345"
  And I press "login"
  Then I should see shirley65's page

Scenario: incorrect login
  When I fill in "username" with "shirley65"
  And I fill in "password" with "password"
  And I press "login"
  Then I should see login incorrect page
