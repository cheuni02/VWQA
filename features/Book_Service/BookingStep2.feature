@Daily @vw-plugin-cps-vw-section-owners
Feature: Booking a service Step 2
  As we need our customers to be able to book a car service
  We need to ensure that they can enter all the registration details of their car
  And if the car is a new model we need to ask them for all their car details

  Background: Selecting a dealer location
    Given i select and confirm the location where i want my car to be serviced

  Scenario: Entering a valid registration number
    When i submit my car registration details as "FE06 KHO"
    Then i should see my car model name and date of manufacture appear in the form fields
    And i should see a button to allow me to correct my details if they are incorrect

  Scenario: Entering an invalid registration number
    When i submit a car registration number of "UU01 UUB"
    Then i should see an error message informing me that my car details could not be found

  Scenario: Proceeding to step 3 with a valid car registration
    Given i enter a car registration number of "FE06 KHO"
    When i enter my mileage count as "10000"
    And i submit my information to the page form
    Then i should be shown a list of service options and the price

  Scenario: Editing valid car registration details
    Given i enter my car details again by using a registration number of "FE06 KHO"
    When i decide to adjust the details that have been detected
    Then i should be able to change my car model and its other details
    And if i then enter a mileage count of "10000" before submitting the form
    Then i should be able to proceed to the next step of booking a car service

  Scenario: Setting a leased car for a service
    Given i enter my cars registration number as "FE06 KHO"
    When i set my car to be a leased car that i do not own
    Then i should see a text field requiring me to enter which company i leased the car from
    And if i enter that company name as "Cars Ltd" And proceed to the next stage
    Then i should be able to continue with choosing my car service options

  @Slow
  Scenario Outline: Car Details Validation
    Given i enter my car registration number as "B1B BT3"
    When i enter the car model information as <model> with a derivative of <derivative>
    And i enter the cars engine capacity as <capacity> and manufacture year of <year>
    And i set the cars transmission to <transmission> and its fuel type <fuel>
    And i give a mileage value of <mileage> in the form provided
    Then i <proceed> be able to continue with my service booking when i try to continue

    Examples:
    | model  | derivative | capacity | year | transmission |  fuel  | mileage | proceed    |
    | beetle | Testing    | 1.6      | 1990 | Manual       | Petrol | 10000   | should     |
    | beetle | Testing    | 0        | 1980 | Manual       | Petrol | 10000   | should not |
    | beetle | Testing    |          | 1980 | Manual       | Petrol | 10000   | should not |
    | golf   |            | 1.8      | 1980 | Manual       | Petrol | 10000   | should not |
    | fox    | Testing    | 1.6      |      | Manual       | Petrol | 10000   | should not |
    | fox    | Testing    | 1.6      | 1970 |              | Petrol | 10000   | should not |
    | golf   | Testing    | 1.6      | 1970 | Automatic    |        | 10000   | should not |
    | beetle | Testing    | 1.6      | 1970 | Automatic    | Diesel |         | should not |
    |        | Testing    | 1.6      | 1970 | Automatic    | Diesel | 10000   | should not |
    | fox    | Testing    | 1.6      | 1990 | Automatic    | Diesel | 0       | should     |
    | golf   | Testing    | 1.6      | 1990 | Automatic    | Petrol | 40000   | should     |
    | beetle | Testing    | 1.6      | 1066 | Automatic    | Petrol | 40000   | should not |
    | golf   | Testing    | 1.6      | -999 | Automatic    | Petrol | 40000   | should not |
