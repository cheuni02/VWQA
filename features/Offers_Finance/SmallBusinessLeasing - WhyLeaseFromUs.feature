@vw-phoenix
Feature: Why Lease From Us
  As we have potential small business customers
  We need to make sure that this page provides the right information
  And can direct customers to relevant sections of the site

  Background:
    Given I have loaded the Why Lease From Us page

  Scenario: Page Load
    Then the page should have loaded successfully

  Scenario Outline: Link navigation
    When I click on the <link> tile on the lower section of the page
    Then it will direct you to the correct page

  Examples:

  | link                             |
  | Tax Calculator                   |
  | View our latest offers           |
  | Contract hire finance calculator |
  | Fleet 50 cars                    |

  Scenario Outline: Find specialist - Postcode
    When I enter my local postcode as <postcode> to the find specialist field
    Then there <post_result> be a search result displayed in my browser
  Examples:

  | postcode | post_result |
  | W2 6AA   | should      |
  | WC2N 6LE | should      |
  | 12345    | should not  |
  | CF23 6DT | should      |

  Scenario Outline: Find specialist - Name
    When I enter a name as <name>
    Then it comes back with a <name_result> result

  Examples:

  | name    | name_result |
  | Cardiff | pass        |
  | Test    | fail        |
