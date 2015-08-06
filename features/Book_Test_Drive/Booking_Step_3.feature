@vw-web-site
Feature: Book a Test Drive - Step 3
  As a prospective VW customer
  I want to choose what day I want to book a test drive
  And then enter my details

  Scenario: Page Load
    Given that I have loaded step 3 of the process
    Then step 3 should be loaded
    And the number of days available should be "14"

  Scenario: Choose day
    Given that I have got to step 3 of the process
    When I click on a day
    And I click on the button to proceed
    Then step 4 should be shown
