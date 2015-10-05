@vw-plugin-cps-vw-section-about-us
Feature: History of VW
  As the owner of the VW website
  I want people to easily see how the company was built
  And the history behind our products

  Background:
    Given that I have loaded the timeline

  Scenario: Loading the page in list mode
    When I have selected list mode
    Then I should see the timeline in list mode

  Scenario: Loadng the page in Timeline mode
    When I have selected timeline mode
    Then I should see the timeline in timeline mode

  Scenario Outline: Searching the timeline
    When I enter <search> into the search box
    And I set the decade to <decade>
    Then I should only see <search> in the timeline

  Examples:

  | search      | decade |
  | Paul Willis | 2000   |

  Scenario Outline: Navigating decades
    When I click on the <decade> button
    Then only articles from the <decade>s will be shown

  Examples:

  | decade |
  | 1900   |
  | 1910   |
  | 1920   |
  | 1930   |
  | 1940   |
  | 1950   |
  | 1960   |
  | 1970   |
  | 1980   |
  | 1990   |
  | 2000   |
  | 2010   |
