Feature: Search Box
	In order to get direction
	A user
	Should input their locations

	Scenario: Input locations
		Given I am on the home page
		And I fill in "start" with "UCCS"
		And I fill in "end" with "Pikes Peak"
		When I press "submit"
		Then I see directions on map
