@vw-plugin-cps-vw-section-owners
Feature: Warning Lights
  As an owner of a VW
  I want to see what each warning light means
  And how to resolve it

  Background:
    Given the warning lights page is loaded

  Scenario: Page Load
    Then the warning lights page should be loaded correctly

  Scenario Outline: Categories
    When I click each of the <category>
    Then only <category> lights should be shown

  Examples:
  
  | category |
  | All      |
  | Red      |
  | Yellow   |
  | Green    |
  
  Scenario: Clicking for more information
    When I click on Brake system
    Then the title should be shown on the next page