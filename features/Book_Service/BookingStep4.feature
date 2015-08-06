@Daily @vw-plugin-cps-vw-section-owners
Feature: Booking A Service Step 4
  As we have now entered our car details and seleced what work we would like to have complete on our car
  We now need to ensure that we can select a valid time and date for the service to take place
  And that we can select a variety of service options

  Background: Entering my car details and service options
    Given i am selecting which courtesy option i want when booking a service for my car

  Scenario: Continuing without selecting a service time
    When i try to continue to the next step without selecting a time for my service
    Then i should see an error message shown in my browser telling me to select a time

  Scenario: Selecting to loan a car
    When i select the option to have a car loaned to me when i book my service
    Then i should see two further insurance based options appear on my screen

  Scenario: Selecting to Collect and return my car
    When i select the option to have my car collected and returned to me
    Then i should see another two options relating to the distance required in order to have my car collected

  Scenario: Selecting a time and proceeding to the next step
    When i select a time of "11am - 12pm" from the list of options on the page
    And i proceed to the next step of completing my service booking
    Then i should see a form requiring me to enter my personal details
