@Daily @vw-plugin-cps-vw-section-fleet
Feature: Fleet - Residual Value
  As part of the site features for business users
  We need to provide information about residual values
  So that business users can value their fleet in case of upgrade or business change

  Background: Showing the Fleet Residual Value page
    Given i am viewing fleet residual value page on the website


  Scenario: Viewing compare residual values page from the homepage
    Given i am visiting the VW website homepage
    Then i click on primary navigation link to Fleet page
    And i click on the button to show calculators and tools page
    And i click on the panel to show the residual value
    Then the residual value page should be loaded in my browser

  Scenario: Verify the main sections are displayed on the page
    Then i should see all the required sections on residual value page

  Scenario Outline: Testing cars on the residual value page
    When i select car model <model> from the horizontal list on the page
    Then i should see a table containing comparison on residual values with other brands
    And i should see data that has been updated in the last two months

    Examples:
      | model           |
      | up! BMT         |
      | Polo BMT        |
      | Golf BMT        |
      | Golf Estate BMT |