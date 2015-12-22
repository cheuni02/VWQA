#@my_vw @Service-Booking-2
Feature: Service booking Step 2 My details
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 in book a service and be taken to Step 2
  where i will need to fill in My personal details

  Background:
    Given i have completed Step 1
    And click the next My details button

  Scenario: Check Step 1 details are present above
    When Step 2 of book a service has loaded
    Then i should see the step 1 details above

  @login
  Scenario: Get to Step 2 My details (Logged In)
    When i am on Step 2 of book a service
    Then i should see my personal details and address cards already populated

  Scenario: Get to Step 2 (Not Logged in)
    When the Step 2 page of book a service has loaded
    Then i should be able to see Step 2 where i can fill in my personal details

  Scenario Outline: Validating Edit my Personal details
    When i click the edit link on the personal details card
    And i fill in the my <first_name>, <last_name>, <mobile> and <email>
    Then i should get a <message> message if any details are not valid

    Examples:
      | first_name | last_name | mobile      | email                    | message  |
      | Test       |           | 07889093223 | tribaltester@outlook.com | error    |
      |            | Tester    | 07889093223 | tribaltester@outlook.com | error    |
      | Test       | Tester    |             | tribaltester@outlook.com | error    |
      | Test       | Tester    | 07889093223 |                          | error    |
      | Test       | Tester    | 07889093223 | tribaltester@outlook.com | no error |
      | £$£$£      | £$£$      | $"£"£       | £$35252.com              | error    |

  Scenario Outline: Validating Edit my Address
    When i click the edit link on the Address card
    And i fill in the required information such as <house_no>, <postcode>, <address_line1> and <city>
    Then i should see an <message> message if details need to be completed

    Examples:
      | house_no | postcode | address_line1       | city   | message |
      | 12       |          | Bishops bridge road | London | error   |
      | 12       | W2 6AA   |                     | London | error   |
      | 12       | W2 6AA   | Bishops bridge road |        | error   |
      |          | W2 6AA   | Bishops bridge road | London | error   |
      | 12       | W2 6AA   | Bishops bridge road | London | no      |
      | £$%      | £$£$£    | £$£$                | $"£"£  | error   |
