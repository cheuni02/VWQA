@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to select a retailer to associate with my added car

  @login_dbg_history_plan_without_car @clear_cookies @delete_all_cars
  Scenario: I try to add two cars concurrently while being near the limit of maximum cars on my account
    Given I have 24 cars in my account
    And my postcode is TS17 5BH
    And I have successfully completed step 1 with registration NU61OJG
    When I select continue to step 2
    Then I will see a summary of my car - step 1:
      | Registration number | Model    | Details                                             |
      | NU61OJG             | Scirocco | SCIROCCO GT BLUEMOTN TECH, 2011, 2.0 Diesel, Manual |
    When a car with registration SB63YSK and display name My Golf is added to my account
    And I select step 2 - Finish
    Then I will see a pop up informing me Car limit reached
    When I select ok

  @login_dbg_history_plan_without_car @delete_all_cars @clear_cookies
  Scenario: I add a car that matches my address and surname
    Given my postcode is TS17 5BH
    And I have successfully completed step 1 with registration NU61OJG
    Then I will see my car details in summary:
      | Registration number | Model    | Details                                             |
      |  NU61OJG             | Scirocco | SCIROCCO GT BLUEMOTN TECH, 2011, 2.0 Diesel, Manual |
    And acquired as will be set to A new car
    And my car will be called My Scirocco by default
    When I select continue to step 2
    And I search for my local VW retailer by location with TS17 5BH
    And I click lookup
    And I select step 2 - Finish
    Then I will see my car dashboard
    And my last added car name is My Scirocco
    And a default picture of my last added car type scirocco is displayed
    When I scroll to my preferred retailer
    Then my retailer is Lookers Teesside is displayed

  @login_dbg_history_plan_without_car @delete_all_cars @clear_cookies
  Scenario: I have previously chosen retailer which I'm presented with when adding a new car
    Given my postcode is TS17 5BH
    And I have successfully completed step 1 with registration NU61OJG
    And I select continue to step 2
    And I search for my local VW retailer by location with Bath
    And I click lookup
    And I select step 2 - Finish
    And I will see my car dashboard

    When I go to add a new car
    And I select the A car I own button
    And I add ML15XHR into the registration field
    And I lookup the registration
    And I select continue to step 2
    And my previously chosen retailer Bath Volkswagen is preselected

  @add_car_user
  Scenario: I try to find my local VW retailer by name
    Given I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    And I can not continue until I provide search criteria for my retailer
    When I search for my local VW retailer by name with b
    Then I will not see search suggestions

    When I search for my local VW retailer by name with ba
    Then I will see search suggestions

    When I select the 3rd option in the list of retailers
    Then I'm presented with my choice of VW retailer

    When I search for my local VW retailer by name with sti
    Then I will see search suggestions

    When I select the 1st option in the list of retailers
    Then I'm presented with my choice of VW retailer

    When I search for my local VW retailer by name with b
    Then I will not see search suggestions

  @add_car_user
  Scenario: I select to view my search in map, then change step 1 details and then return to step 2 my previous selection will still selected
    Given I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    And I search for my local VW retailer by name with edin
    Then I will see search suggestions

    When I select the 1st option in the list of retailers
    Then I'm presented with my choice of VW retailer
    And I select the map tab

    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map
    When I select change step 1
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2015                | 27/04/2015           | 2.0         | Diesel    | Manual       |

    When I select continue to step 2
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the Cancel button
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

  @add_car_user
  Scenario: I try to find my local VW retailer by name of local town
    Given I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    And I search for my local VW retailer by location with berlin
    And I click lookup
    Then I will see message No results found. matching my search

    When I search for my local VW retailer by location with bath
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers
    And the first retailer is selected

    When I select the 2nd local retailer
    Then my choice of retailer will be selected

    When I select the 3nd local retailer
    Then my choice of retailer will be selected

    When I select change step 1
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2015                | 27/04/2015           | 2.0         | Diesel    | Manual       |

    When I select continue to step 2
    Then my choice of retailer will be selected

  @add_car_user
  Scenario: I try to find my local VW retailer by postcode and view in maps
    Given I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    When I search for my local VW retailer by location with VX4 5BQ
    And I click lookup
    Then I will see message No results found. matching my search

    When I search for my local VW retailer by location with M34 5GH
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers
    And the first retailer is selected

    When I select the 5th local retailer
    Then my choice of retailer will be selected

    When I search for my local VW retailer by location with AL5
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers

    When I select the 4th local retailer
    Then my choice of retailer will be selected

    When I select the map tab
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

    When I select View in maps
    Then I will see an enlarged map
    When I close the large map
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

  @add_car_user
  Scenario: I leave the add a car flow
    Given I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the I'm sure button
    Then I will be on the dashboard