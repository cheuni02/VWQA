@MPV @Daily
Feature: My Perfect VW - Shortlist
  As the own of the VW website
  Once a customer has chosen their preferences
  They should then see a shortlist of cars available

  Background:
    Given that I have loaded MPV
    And I enter the shortlist

  Scenario: Shortlist - Loading
    Then the page should load correctly

  Scenario: Shortlist - More Cars
    When I click on the More matches button at the bottom of the page
    Then more options should appear

  Scenario: Shortlist - Details
    When I click on the cars
    Then I should see the correct details page
