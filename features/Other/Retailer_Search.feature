@Daily @vw-retailers-site
Feature: Searching for Retailers
  As we have the ability to allow our users to search for specific VW Dealers
  We need to make sure that this search functionality works as expected
  And that users who use the retailer search are taken to valid pages on the VW Website

  Background: Visiting the retailer search webpage
    Given i visit the correct webpage for searching for VW Dealers in my local area

  Scenario Outline: Searching For Retailers By Location
    When i search for my current location of <location> using the retailer location search
    Then i should see the first retailer name of <retailer> shown in a list of retailers

    Examples:
    | location  | retailer                            |
    | UB6 7HA   | Citygate Ruislip                    |
    | Watford   | Citygate Watford                    |
    | Edinburgh | Western Volkswagen (Edinburgh East) |
    | Cardiff   | Sinclair Volkswagen (Cardiff)       |
    | London    | Alan Day Volkswagen (City)          |
    | Belfast   | Isaac Agnew of Belfast              |
    | Aberdeen  | Specialist Cars (Aberdeen)          |
    | SW14 7RP  | West London Volkswagen              |
    | SA31 1NY  | Sinclair Volkswagen (Swansea)       |
    | HS5 3TS   | Hawco Inverness                     |
    | Toronto   | error                               |
    |           | error                               |
    | Paris     | error                               |
    | A9NNNN    | error                               |
    | 123453    | error                               |

  Scenario: Using Top Level Nav to visit retailer search
    Given i am on the VW Homepage of the website
    When i click on the top level nav button to Find Retailers
    Then i should see the Retailer search page load correctly in my browser

  Scenario: Showing a map view of retailers
    When i search for a retailer in my local area of "Uxbridge"
    And i click on the tab link to view results on a map
    Then i should see a map image displayed with pins representing my local retailers

  Scenario: Booking a Test Drive with a retailer
    When i search again for a retailer in the "Watford" Area
    And i want to book a test drive with the closest retailer to me
    Then i should see the book a test drive page load in my browser
    And i should also see the second step information has been filled in with my chosen retailer

  Scenario: Booking a Service with a retailer
    When i search for Volkswagen retailers near "Aberdeen"
    And i decide to book a service for my volkswagen car
    Then i should be taken to the second step of booking a service as my retailer information is already complete

  Scenario: Viewing Retailer offers
    When i search for a local retailer near "Inverness"
    And i view the latest offers for the first retailer in the results list
    Then i should see a page containing a list of relevant offers from my local retailer

  Scenario: Viewing the Service Promise Page
    When i select the button at the bottom of the page to view the Volkswagen Service Promise
    Then the service promise webpage should load inside my browser

  Scenario: Viewing the status of my order
    When i click the page button to track my current Volkswagen car order
    Then i should be taken to a webpage where i can enter my Volkswagen order number

  Scenario: Booking a Test Drive without a retailer
    When i click on the page link to book a test drive with Volkswagen
    Then the first step of booking a test drive should appear in my browser

  Scenario: Booking a Service without a retailer
    When i click the button on the page to book a service without performing a retailer search
    Then i should be taken to the start of the service booking process
