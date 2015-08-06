@Daily @vw-plugin-cps-vw-section-owners
Feature: Booking a Service Step 1
    When we are navigating through the VW Website
    We want to be able to book a service for our car
    And we therefore should see the booking pages displayed correctly

  Scenario: Getting to the booking section
    Given i navigate to the VW Homepage on the website
    When i click on the button to book a service
    Then i should see the first page of the booking form shown in my browser

  Scenario: Viewing Service Dealers Near my Location
    Given i go back to the service booking homepage and enter my location as "Uxbridge"
    When i submit my location to the form on the webpage
    Then i should see a list of different service dealers nearby displayed in my browser
    And i should see information about one of the service dealers such as opening times

  Scenario: Viewing Service dealers on a map view
    Given i enter another search location of "CA15 8QH"
    When i search for this location on the book a service page
    And i decide to view a map of all nearby car servicing retailers
    Then i should see a map presented on the page containing all my nearby service dealers

  Scenario: Progressing to Step 2 of service booking
    Given i enter my location as "HX6 3RB"
    When i submit my location information to the service dealer pages
    And i continue to the next step of booking my service request
    Then i should see a field that will allow me to enter the registration details of my car

  @Slow
  Scenario Outline: Entering my Location
    When i enter and submit <locationEntry> as my location in the text field
    Then an error <issue> be presented on the page in my browser

    Examples:
    | locationEntry | issue      |
    |               | should     |
    | 1             | should     |
    | HX6 3RB       | should not |
    | CA15 8QH      | should not |
    | E1W 2PU       | should not |
    | E17 6DN       | should not |
    | 000000000     | should     |
    | London        | should not |
    | Uxbridge      | should not |
