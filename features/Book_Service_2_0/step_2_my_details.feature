@Book_Service_2
Feature: Service booking Step 2 My details
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 in book a service and be taken to Step 2
  where i will need to fill in My personal details

    Background:
      Given i have completed Step 1
      And click the next My details button

    @login
    Scenario: Get to Step 2 My details (Logged In)
      When i am on Step 2
      Then i should see my personal details and address cards already populated

    Scenario: Get to Step 2 (Not Logged in)
      Given i am not logged in to an account
      When i click the book a service button
      And i complete Step 1
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
      And i fill in the required information suh as <postcode>, <address_line1>, <town> and <county>
      Then i should see an error message if details need to be completed

      Examples:
        | postcode | address_line1          | town   | county         | message |
        |          | 12 Bishops bridge road | London | Greater London | yes     |
        | W2 6AA   |                        | London | Greater London | yes     |
        | W2 6AA   | 12 Bishops bridge road |        | Greater London | yes     |
        | W2 6AA   | 12 Bishops bridge road | London |                | yes     |
        | W2 6AA   | 12 Bishops bridge road | London | Greater London | no      |
        | £$£$£      | £$£$      | $"£"£       | £$35252.com          | yes     |
