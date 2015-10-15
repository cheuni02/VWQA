Feature: Service booking Step 3 Retailer
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 and Step 2 in book a service and be taken to Step 3
  where i will need to fill in my Retailer details

    Background:
      Given i have completed Step 1 and 2
      And click the next Retailer button

    Scenario: Get to Step 3 (Logged in)
      When i am on the Step 3 retailer page
      Then i should see my retailer already chosen in the retailer card

    Scenario: Get to Step 3 (Not Logged in)
      When step 3 choose retialer page has loaded
      Then i should be able to choose my retailer

    Scenario Outline: Edit My retailer - Search by location
      Given i am on the Step 3 page
      And i have clicked on the edit link in the My retailer card
      When i enter a <location>
      And click lookup
      Then i should be able to see a list of retailers appear
      And i should also be able to view a map view of the closest retailers

      Examples:
        | location      |
        | W2 6AA        |
        | Milton Keynes |
        | NW9 9JR       |
        | Birmingham    |

    Scenario Outline: Edit My retailer - Search by name
      Given i am on the Step 3 page of book my service
      And i am on the edit my retailer details view
      When i enter a retailer <name>
      Then i should be able to select a retailer in the dropdown

      Examples:
        | name             |
        | Birmingham       |
        | Brighton         |
        | Citygate Watford |
