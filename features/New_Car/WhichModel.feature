@vw-plugin-cps-vw-section-new-cars
Feature: Which Model
  As a prospective owner of a VW
  I want to compare multiple forms of the same model
  And figure out which one is the one for me

  Background:
    Given I have navigated to the which model page

  Scenario: Page Load
    Then the which model landing page has loaded successfully

  Scenario Outline: Information
    When I click on the image of <model>
    Then it's showing the <title> on the page

  Examples:

  | model     | title    |
  | take-up   | Take up! |
  | move-up   | Move up! |
  | high-up   | High up! |
  | rock-up   | Rock up! |

  Scenario: Comparison Table
    When I click on the "Wheels" section
    Then the section should open correctly
