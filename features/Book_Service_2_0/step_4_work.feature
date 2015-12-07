@my_vw @Service-Booking-2
Feature: Service booking Step 4 Select Work
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 - 3 in book a service and be taken to Step 4
  allowing me to select the work i need done to my car

    Background:
      Given i have completed book a service steps 1-3

    @login @logout-force
    Scenario: Get to Step 4 (Logged in)
      When i am on Step 4
      Then i should be able to see the service panel
      And the Service and MOT sections

    Scenario: Get to Step 4 (Not Logged in)
      When i am on step 4 and am not logged in
      Then i should be able to see all the options i have available for my Car

    Scenario Outline: Check to see activities appear under sections
      Given i am on Step 4 select work
      When i view the service panel then the following section <section> should appear
      Then i should see activities i can select below the <section> section

      Examples:
        | section               |
        | routine-work          |
        | unplanned-maintenance |

    Scenario: Anything else input box
      Given i am on the Select work page
      When i have selected a few work activities for my car
      Then i should be able to enter some information on what i would like to be checked
      And i should see my work options appear in the information box

    Scenario: Validation when not selecting anything
      When i do not select any options on the Step 4 page
      Then i should get an error message asking me to select an option or call them

    Scenario: Select Recommended Work options
      Given i edit the details of my service work
      When i select some recommended work options from the list in my browser
      Then i should see the price for my service change to reflect my choice

    Scenario: Select Unplanned Maintenance options
      When i view the unplanned maintenance section
      Then i should be able to select unplanned maintenance options for my car
      And i should see the unplanned options appear in the work summary
