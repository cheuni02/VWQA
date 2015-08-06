@Daily @vw-plugin-cps-vw-section-owners
Feature: Booking a Service Step 5
  As we have now selected a date and time for our car service to take place
  We now need to be able to enter our personal details such as name and address
  So that our car can be collected and delivered to the correct house of residence

  Background: Entering my car service details
    Given i am entering my personal details for finalizing my service booking

  Scenario: Autocompleting my valid address details
    When i search for my valid address using the postcode "UB6 7HA"
    Then i should see my town information appear as "Greenford"

  Scenario: Autocompleting my invalid address details
    When i search for my invalid address using the postcode "A66 7AA"
    Then no details should be entered into the other address fields on the page

  Scenario: Using my Address for picking up and collecting my car
    Given i change my convenience option to have my car picked up and collected
    When i need to use my main address to have my car collected from
    And i also need to use my main address to have my car dropped off at
    Then i should find that the address fields in these sections are disabled

  @Slow
  Scenario Outline: Entering Personal Details
    When i enter my personal details as <title> <firstName> <surname>
    And i enter my contact information including telephone number of <telephone> and email address <email>
    And i enter my address as "UB6 7HA" and use this address for picking up and collecting my car
    And i randomly set my communication preferences using the checkboxes provided
    Then i <proceed> find that i am able to continue to the next step of booking my car service

  Examples:
    | title | firstName | surname | telephone          | email            | proceed    |
    | Mr    | testy     | tester  | 02079460777        | test@example.com | should     |
    | Mrs   |           | tester  | 02079460777        | test@example.com | should not |
    | Miss  | testy     |         | 02079460777        | test@example.com | should not |
    | Ms    | testy     | tester  |                    | test@example.com | should not |
    | Dr    | testy     | tester  | 02079460777        |                  | should not |
    | Prof  | testy     | tester  | ABC                | test@example.com | should not |
    | Lord  | testy     | tester  | 999999999999999999 | test@example.com | should not |
    | Lady  | testy     | tester  | 02079460777        | test@example     | should not |
    | Sir   | testy     | tester  | 02079460777        | test.com         | should not |

    @Disabled
    Scenario: Completing my Service Booking
    When i enter my personal details to the required fields
    And i click the button to confirm my details
    Then i should be taken to the confirm my details page
    And if i confirm my details using the review and confirm button
    Then i should see the booking confirmation screen appear in my browser
