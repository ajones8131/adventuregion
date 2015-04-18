Feature: display a list of valid places sorted by different criteria

  As an adventurer
  So that I can find places to go
  I want to see places filtered or sorted by category,price, or popularity

Background: places have been added to the database

  Given the following places exist:
  | name                  | category   | price   | popularity | latitude | longitude  |
  | Pikes Peak            | Hiking     | Low     | Medium     | 38.84087 | -105.04226 |
  | Blodgett Peak         | Hiking     | Free    | Low        | 38.84087 | -105.04226 |
  | Mt Rosa               | Hiking     | Free    | Low        | 38.84087 | -105.04226 |
  | Cheyenne Canyon       | Hiking     | Free    | Medium     | 38.84087 | -105.04226 |
  | Go-kart racing        | Fun        | Medium  | High       | 38.84087 | -105.04226 |
  | Harmony Bowl          | Fun        | Low     | High       | 38.84087 | -105.04226 |
  | All-Star Paintball    | Shooting   | Medium  | High       | 38.84087 | -105.04226 |
  | Dragonmans            | Shooting   | Low     | High       | 38.84087 | -105.04226 |
  | Sky-zone              | Fun        | Medium  | High       | 38.84087 | -105.04226 |
  | Sports Climbing Center| Climbing   | Medium  | High       | 38.84087 | -105.04226 |
  | City Rock             | Climbing   | Medium  | High       | 38.84087 | -105.04226 |
  | Skydiving             | Adrenaline | High    | Low        | 38.84087 | -105.04226 |

  And I am on the place index page

Scenario: Auto Sort By Category
  When I follow "name"
  Then I should see "Skydiving" before "Pikes Peak"
  And I should see "Sky-zone" before "Dragonmans"
  And I should see "City Rock" before "Go-kart racing"



Scenario: filter places by category
  When I select Hiking from category

  And I press "Filter"
  Then I should see "Pikes Peak"
  And I should see "Blodgett Peak"
  And I should see "Mt Rosa"
  And I should see "Cheyenne Canyon"
  And I should not see "Go-kart racing"
  And I should not see "Harmony Bowl"
  And I should not see "All-Star Paintball"
  And I should not see "Dragonmans (shooting)"
  And I should not see "Dragonmans (paintball)"
  And I should not see "Sky-zone"
  And I should not see "Sports Climbing Center"
  And I should not see "City Rock"
  And I should not see "Skydiving"

Scenario: filter places by price
  When I select Free from price

  And I press "Filter"
  Then I should not see "Pikes Peak"
  And I should see "Blodgett Peak"
  And I should see "Mt Rosa"
  And I should see "Cheyenne Canyon"
  And I should not see "Go-kart racing"
  And I should not see "Harmony Bowl"
  And I should not see "All-Star Paintball"
  And I should not see "Dragonmans (shooting)"
  And I should not see "Dragonmans (paintball)"
  And I should not see "Sky-zone"
  And I should not see "Sports Climbing Center"
  And I should not see "City Rock"
  And I should not see "Skydiving"

Scenario: filter places by popularity
  When I select Low from popularity

  And I press "Filter"
  Then I should not see "Pikes Peak"
  And I should see "Blodgett Peak"
  And I should see "Mt Rosa"
  And I should not see "Cheyenne Canyon"
  And I should not see "Go-kart racing"
  And I should not see "Harmony Bowl"
  And I should not see "All-Star Paintball"
  And I should not see "Dragonmans (shooting)"
  And I should not see "Dragonmans (paintball)"
  And I should not see "Sky-zone"
  And I should not see "Sports Climbing Center"
  And I should not see "City Rock"
  And I should see "Skydiving"

  Scenario: show existing place details

    When I click "Pikes Peak"
    Then I should see "Showing Details for Pikes Peak"

  Scenario: edit existing place
    When I click "Pikes Peak"
    Then I click "Edit Record"
    And I fill out "place[name]" with "Barr Trail"
    Then I press "Update Place"
    Then I should see "Showing Details for Barr Trail"