Feature: display a list of valid places sorted by different criteria

  As an adventurer
  So that I can find places to go
  I want to see places filtered or sorted by category,price, or popularity

Background: places have been added to the database

  Given the following places exist:
  | name                  | category   | price   | popularity |
  | Pikes Peak            | Hiking     | low     | medium     |
  | Blodgett Peak         | Hiking     | free    | low        |
  | Mt Rosa               | Hiking     | free    | low        |
  | Cheyenne Canyon       | Hiking     | free    | medium     |
  | Go-kart racing        | fun        | medium  | high       |
  | Harmony Bowl          | fun        | low     | high       |
  | All-Star Paintball    | shooting   | medium  | high       |
  | Dragonmans (shooting) | shooting   | low     | high       |
  | Dragonmans (paintball)| shooting   | medium  | high       |
  | Sky-zone              | fun        | medium  | high       |
  | Sports Climbing Center| climbing   | medium  | high       |
  | City Rock             | climbing   | medium  | high       |
  | Skydiving             | adrenaline | high    | low        |

  And I am on the home page

Scenario: sort places by price
  When I follow "Price"
  Then I should see "Blodgett Peak" before "Pikes Peak"

Scenario: sort places by category
  When I follow "Category"
  Then I should see "Skydiving" before "Sports Climbing Center"

Scenario: sort places by popularity
  When I follow "Popularity"
  Then I should see "Skydiving" before "Cheyenne Canyon"

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

