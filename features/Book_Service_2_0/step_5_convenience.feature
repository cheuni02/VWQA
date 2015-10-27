@Book_Service_2 @step_5 @my_vw
Feature: Book a Service Convenience Options
  As a service booking customer that has entered all their previous details
  Once i reach step 5 of booking a service for my car
  I should find i am able to specify any convenience options for my car service
  And i should also be able to choose a time for my service

    Background: Getting to step 5 of booking a service
      Given i complete all previous required steps to book my car service

    Scenario: Selecting a date for my Service
      When i select the first available date in the table
      Then i should find that my service booking date is locked in

    Scenario: Changing the month of my service
      When i click on the right arrow in the calender table
      Then i should see the month that i am selecting update

    Scenario: Checking for All my convienence options
      When i check the list of available convieneance options
      Then i should see a list of the following items
      | Not required      |
      | Loan car          |
      | Collect & Deliver |
      | Courtesy lift     |
      | Collection only   |
      | Delivery only     |

    Scenario: Attempting to continue without setting any date
      When i attempt to continue without setting a date or time for my service
      Then i should see an error message displayed in my browser

    Scenario: Setting Collection Address
      When i change the collection address setting to not use my default address
      Then i should see a set of fields to enter a new collection address

    Scenario: Setting Delivery Address
      When i change the delivery address setting to not use my default address
      Then i should see a set of fields to enter a new delivery address

    Scenario: Confirming My Convieneance options
      Given i select a valid date from the calender for my service
      And i select a time and convienece option that suits me
      When i submit my confirmation of these details
      Then i should see the final stage of booking a service
