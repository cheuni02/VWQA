@MPV @Daily
Feature: My Perfect VW - Must Haves
  As the owner of the VW website
  On navigating to the new My Perfect Volkswagen page
  The page should load correctly

  Scenario: Page loading - Must Haves Intro
    Given that I have loaded the Must Haves Page
    When the page is loaded
    Then I should see "4" questions and see cars button

  Scenario: Page loading - Questions
    Given that I have loaded the Must Haves Page
    When the must haves page is loaded
    And I click the first question
    Then the first page of the must haves section is shown

  Scenario Outline: Checking the pages
    Given that I have loaded page <page>
    When the page has loaded
    Then the number of answers on the page must be <answers>

  Examples:
  | page | answers |
  | 1    | 3       |
  | 2    | 3       |
  | 3    | 3       |
  | 4    | 3       |
