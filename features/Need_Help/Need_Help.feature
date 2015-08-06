@Daily @ask-volkswagen @need-help
Feature: Need Help
  Since we offer our customers a range of products and services
  We need to ensure that customers questions are answered
  And that the customer can browse through and find the answers they need

  Scenario: Visiting the Need Help section
    Given i have come back to the VW Hompage
    When i select the Need Help link in the top menu navigation
    Then i should be taken to the main FAQ Page on the site

  Scenario: Searching for a answer
    Given i have another query that i need help with
    When i enter a search query of "Bluemotion" into the search for an answer box
    Then i should see search results appear on the page with answers to my questions

  Scenario Outline: Selecting Categories
    When i select the <category> from the list of possible options
    Then i should see a series of answers displayed on the page

    Examples:
    | category     |
    | About Us     |
    | Fleet        |
    | New Cars     |
    | Owners       |
    | Technology   |

