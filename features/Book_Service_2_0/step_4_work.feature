@step_4 @my_vw
Feature: Service booking Step 4 Select Work
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 - 3 in book a service and be taken to Step 4
  allowing me to select the work i need done to my car

    Background:
      Given i have completed book a service steps 1-3

    @login
    Scenario Outline: Get to Step 4 (Logged in)
      When i am on Step 4
      Then i should be able to see the following <work> sections

      Examples:
        | work                  |
        | Recommended work      |
        | Routine work          |
        | Unplanned maintenance |
        | Additional infomation |
        | Estimated total price |

    Scenario: Get to Step 4 (Not Logged in)
      When i am on step 4 i should be able to see what work can have done on my car
      Then i should be able to select items i want to be done

    Scenario: Select Work items
      Given i am on Step 4 select work
      When i check each <section>
      Then i should see activities i can select below
      And i should be able to select an activity

      Examples:
        | section               |
        | Recommended work      |
        | Routine work          |
        | Unplanned maintenance |

    Scenario: Anything else input box
      Given i am on the Select work page
      When i have selected a few work activities for my car
      Then i should be able to enter some information on what i would liked to be checked

    Scenario: Validation when not selecting anything
      When i do not select any options on the Step 4 page
      Then i should get an error message asking me to select an option or call them
