@vw-plugin-cps-vw-section-new-cars @Disabled
Feature: Explore Page
  As a prospective VW owner
  I want to see media for the model that I'm looking at
  To see what's on offer

  Background:
    Given I'm loading the explore page for the up-nf model

  Scenario: Page Load
    Then explore page should load correctly

  Scenario: 360 view
    When the 360 view button is pressed
    Then the image should change into the 360 degree model

  Scenario: Interior Features - Gallery
    When i view the section of the page with a header "Interior Features"
    And i click on the button to view the gallery for this car model
    Then i should find the gallery slide has appeared within the content section

  Scenario: Interior Features - View
    Then there should be "4" slides

  Scenario: Stylish Features - Gallery
    When I view the stylish gallery
    Then I'll load slide "4"

  Scenario: Stylish Features - View
    Then there'll be "4" slides

  Scenario: Driving Features - Gallery
    When I wish to view the driving gallery
    Then I'll load slide "4" which is the last

  Scenario: Driving Features - View
    Then there will be "4" slides
