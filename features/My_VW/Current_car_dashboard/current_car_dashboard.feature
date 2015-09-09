Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

    Background:
      Given that i have logged in to my VW account

    Scenario: Current car dashboard
      When the current car dashboard is loaded
      Then the I am greeted with the text "Hello <user name>"

    Scenario: Car health
      When I select "Car health" button on the dashboard
      Then the "Car health" module is displayed

    Scenario: Camera icon
      When I click on the camera icon
      Then the system file selector is displayed to choose a photo

    Scenario: Car Health Module -
      And i am on the car health module
      When i check to see my car health
      Then i should see my car health details
      And my next actions

    Scenario Outline: My Service gurantee module
      When i click on a <gurantee>
      Then i should be taken to the relevant page

      Examples:
        | gurantee |
        |          |
        |          |
        |          |
        # input link href above

    Scenario: My Service history
      When i am on the service history module
      Then i should see my vehicles service history

    Scenario: My Plans
      When i am on the my plans section
      Then i should see any plans that i have

    Scenario Outline: Promo Module
      When i am on the prom modules section
      Then i should see the <promotions>

      Examples:
        | Summer health check   |
        | Get the app           |
        | Retailer local offer  |
        | Fixed price servicing |
        | Extended Warranty     |
        | Accessories           |

    Scenario Outline: Need help module
      When i am on need help module
      Then i should see the search bar and following <useful links>

      Examples:
        | useful links            |
        | Owner's manual          |
        | Warning lights          |
        | How tos                 |
        | Breakdown and insurance |

    Scenario Outline: Preferred Retailer
      When i am on the Current dashboard
      Then i should see my preferred retailer and the following <links>

      Examples:
        | links            |
        | View in maps     |
        | Retailer website |

    Scenario Outline: Recovery zone
      When i scroll to the bottom of the page
      Then the relevant dashboard <buttons> should appear

      Examples:
        | Book a service   |
        | TBD              |
        | Keep me informed |
        | Contact us       |
