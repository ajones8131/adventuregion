Feature: display a list of valid places sorted by different criteria

  As an adventurer
  So that I can find places to go
  I want to see places filtered or sorted by category,price, or popularity

Background: places have been added to the database

  Given the following places exist:
  | name                  | category   | price   | popularity |
  | Pikes Peak            | Hiking     | Low     | Medium     |
  | Blodgett Peak         | Hiking     | Free    | Low        |
  | Mt Rosa               | Hiking     | Free    | Low        |
  | Cheyenne Canyon       | Hiking     | Free    | Medium     |
  | Go-kart racing        | Fun        | Medium  | High       |
  | Harmony Bowl          | Fun        | Low     | High       |
  | All-Star Paintball    | Shooting   | Medium  | High       |
  | Dragonmans            | Shooting   | Low     | High       |
  | Sky-zone              | Fun        | Medium  | High       |
  | Sports Climbing Center| Climbing   | Medium  | High       |
  | City Rock             | Climbing   | Medium  | High       |
  | Skydiving             | Adrenaline | High    | Low        |

  And I am on the home page

Scenario: Auto Sort By Category
  When I follow "name"
  Then I should see "Skydiving" before "Pikes Peak"
  And I should see "Sky-zone" before "Dragonmans"
  And I should see "City Rock" before "Go-kart racing"



Scenario: filter places by category
  When I select Hiking
  And I unselect fun,shooting,climbing,adrenaline
  And I press "Refresh"
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
  When I select free
  And I unselect low,medium,high
  And I press "Refresh"
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
  When I select low
  And I unselect medium,high
  And I press "Refresh"
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