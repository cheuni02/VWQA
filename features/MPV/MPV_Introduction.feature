@Daily @MPV
Feature: My Perfect VW - Introduction
  As the owner of the VW website
  On navigating to the new My Perfect Volkswagen page
  The page should load correctly

  Scenario: Starting the process - Positive
    Given I have loaded the MPV pages
    When I click on the start button to begin my personalised VW Journey
    Then I should be taken to the basics page
    
  Scenario: I know what I want - Positive
    Given I have loaded the MPV page
    When I click on the I know what I want link
    Then I should be taken to the models page
