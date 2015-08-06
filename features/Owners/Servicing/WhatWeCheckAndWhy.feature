@vw-plugin-cps-vw-section-owners
Feature: What we Check and Why
  As an owner of a VW
  I want to know what VW will check
  When it's in for service

  Background:
    Given I have loaded the What We Check and Why page

  Scenario: Page Load
    Then the page in question should be loaded

  Scenario Outline: Check titles
    Then <title> <index> should be displayed

  Examples:

  | index | title                      |
  | 0     | Express visual check       | 
  | 1     | Areas we cover and why     |
  | 2     | Volkswagen Service Regimes | 
  | 3     | Flexible Service Regime    | 
  | 4     | Service Types              | 

  Scenario Outline: Check links
    When I click on the link for <index>
    Then relevant page with <title> should appear

  Examples:

  | index | title                   |
  | 0     | Express visual check    |
  | 1     | Areas we cover and why  |
  | 4     | Areas we cover and why  |