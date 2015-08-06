@MPV @Daily
Feature: My Perfect VW - Basics
  As the owner of the VW website
  On navigating to the new My Perfect Volkswagen Basics page
  The page should load correctly

  Background:
    Given I navigate to the Basics page

  Scenario: Basics - Page Loads with correct items
    Then the number of menu items should be "5"

  Scenario Outline: Basics - Loading the sections
    When I have clicked on the <section> section
    Then there should be <options> options available

    Examples:
    | section     | options  |
    | bodystyle   | 6        |
    | color       | 12       |
    | performance | 3        |
    | transmission| 2        |
    | price       | 19       |

  Scenario: Basics - Selecting body style options
    When I open the Body style panel
    And click all 6 options that are available
    Then only 3 options remain selected
