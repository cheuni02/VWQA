@step_4 @my_vw
Feature: Service booking Step 4 Select Work
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 - 3 in book a service and be taken to Step 4
  allowing me to select the work i need done to my car

    Background:
      Given i have completed book a service steps 1-3

    @login
    Scenario: Get to Step 4 (Logged in)
      When i am on Step 4
      Then i should be able to see the service panel
      And the Service and MOT sections

    Scenario: Get to Step 4 (Not Logged in)
      When i am on step 4 and am not logged in
      Then i should be able to see all the options i have available for my Car
@test
    Scenario Outline: Check to see activities appear under sections
      Given i am on Step 4 select work
      When i view the service panel then the following section <section> should appear
      Then i should see activities i can select below the <section> section

      Examples:
        | section               |
        | routine-work          |
        | unplanned-maintenance |
@test
    Scenario: Anything else input box
      Given i am on the Select work page
      When i have selected a few work activities for my car
      Then i should be able to enter some information on what i would like to be checked

    Scenario: Validation when not selecting anything
      When i do not select any options on the Step 4 page
      Then i should get an error message asking me to select an option or call them

    Scenario: Select Recommended Work options
      When i view the recommended work section
      Then i should be able to select Recommended work options for my car
      And i should see the work option appear in the work summary

    Scenario: Select Unplanned Maintenance options
      When i view the unplanned maintenance section
      Then i should be able to select unplanned maintenance options for my car
      And i should see the unplanned options appear in the work summary

    Scenario: Select an Service and MOT option
      When i view the service and MOT section
      Then i should be able to click on a service and MOT
      And it should appear in the work option summary box
