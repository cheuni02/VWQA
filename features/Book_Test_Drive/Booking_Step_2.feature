@vw-web-site
Feature: Book a Test Drive - Step 2
  After picking a model
  I want to find the nearest retailer
  To book the test drive in

  Background:
    Given I have loaded the book a test drive feature
    And I have selected the "up!" model

  Scenario: Book a Test Drive S2 - Page Load
    Then step 2 should be loaded successfully

  Scenario Outline: Book a Test Drive S2 - Find by Postcode
    When I enter a postcode <postcode>
    Then a list of retailers should appear depending on if it's <result>

  Examples:

  | postcode | result |
  | W2 6AA   | pass   |
  | WC2N 6LE | pass   |
  | CF23 6DT | pass   |
  | 12345    | fail   |
  |          | fail   |

  
  Scenario: Book a Test Drive S2 - Selecting Retailer
    When I enter the postcode "W2 6AA"
    And I select the first retailer
    Then the 3rd step should be loaded
