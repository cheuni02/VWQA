@vw-web-site
Feature: Book a Test Drive - Step 4
  As the prospective VW customer
  I want to be able to enter my details
  So that I can book in a test drive

  Scenario: Page Load
    Given that I have booked a day for the test
    Then step 4 should be loaded

  Scenario Outline: Validation
    Given I have loaded the 4th step
    And I've entered the <Firstname> and <Lastname>
    And I've given my <Housename>, <Addressline1>, <Town> and <Postcode>
    And I've added my <Emailaddress> and <Phonenumber>
    When I click on the submit button for the form
    Then validation should appear for mandatory fields

  Examples:

  | Firstname | Lastname | Housename | Addressline1 | Town   | Emailaddress  | Phonenumber | Postcode |
  |           | Tester   | 1         | Test Street  | London | test@test.com | 01234567890 | W2 6AA   |
  | Test      |          | 1         | Test Street  | London | test@test.com | 01234567890 | W2 6AA   |
  | Test      | Tester   |           | Test Street  | London | test@test.com | 01234567890 | W2 6AA   |
  | Test      | Tester   | 1         |              | London | test@test.com | 01234567890 | W2 6AA   |
  | Test      | Tester   | 1         | Test Street  |        | test@test.com | 01234567890 | W2 6AA   |
  | Test      | Tester   | 1         | Test Street  | London |               | 01234567890 | W2 6AA   |
  | Test      | Tester   | 1         | Test Street  | London | test@test.com |             | W2 6AA   |
  | Test      | Tester   | 1         | Test Street  | London | test@test.com | 01234567890 |          |


  Scenario: Submission
    Given that I have loaded the fourth step
    When I have entered valid details
    And I submit the test drive booking
    Then It should show confirmation of the test drive booking
