@vw-plugin-cps-vw-section-owners
Feature: Servicing and Repairs
  As an owner of a VW
  I should be able to retrieve information about servicing options for my vehicle
  And Book a Service from there

  Background:
    Given that I have loaded the Servicing page

  Scenario: Page Load
    Then the page should be displayed correctly with links

  Scenario Outline: Link Clicking
    When I click on a servicing <option>
    Then I should load the relevant page with the correct <title>

  Examples:

  | option                     | title                      |
  | Book my Service/MOT        | Book a service             |
  | Volkswagen Service Promise | Volkswagen Service Promise |
  | Volkswagen Service Plans   | Volkswagen Service Plans   |
  | Volkswagen Parts guarantee | Parts                      |
  | Body Repair                | Body Repair                |
  | Express fit                | Express Fit                |
  | What we check and why      | What We Check And Why      |
  | Winter Health Check £20    | Winter Check £20           |
