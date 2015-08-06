@vw-phoenix
Feature: Finance Options Explained
  As a user of the VW website
  I want to see finance options available to me
  And be able to access them individually

  Background:
    Given I have loaded the FOE page

  Scenario: Page Load
    Then I should see "5" options

  Scenario Outline: Link Clicking
    When I click on the tile that has a header link to <link>
    Then it will show the correct page

  Examples:

  | link                       |
  | Solutions                  |
  | Hire purchase              |
  | Contract hire              |
  | Existing finance customers |
  | e-Solutions                |
