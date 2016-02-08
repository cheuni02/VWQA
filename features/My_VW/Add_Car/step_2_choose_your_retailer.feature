@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to select a retailer to associate with my added car

  @login_single_car_user
  Scenario: I have completed step 1 and I can see my car details in summary
    Given I have successfully completed step 1 with registration KS64FVZ
    When I select continue to step 2
    Then I will see a summary of my car - step 1:
      | Registration number | Model  | Details                                              |
      | KS64FVZ             | Passat | PASSAT SE BUSINESS TDI BM, 2014, 2 Diesel, Automatic |
    And that my car was acquired as: A new car
    And that I named my car: My Passat
    And my previously chosen retailer Ipswich Volkswagen is preselected

  Scenario: I try to find my local VW retailer by name
    Given I can not continue until I provide search criteria for my retailer
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

  Scenario: I select to view my search in map, then change step 1 details and then return to step 2 my previous selection will still selected
    When I search for my local VW retailer by name with edin
    Then I will see search suggestions

    When I select the 1st option in the list of retailers
    Then I'm presented with my choice of VW retailer
    And I select the map tab

    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map
    When I select change step 1
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2014                | 9/12/2014            | 2           | Diesel    | Automatic    |

    When I select continue to step 2
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the Cancel button
    Then I'm presented with a map view of local VW dealers
    And my choice of retailer is under the map

  Scenario: I try to find my local VW retailer by name of local town
    When I search for my local VW retailer by location with berlin
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
      | Passat | PASSAT SE BUSINESS TDI BM | 2014                | 9/12/2014            | 2           | Diesel    | Automatic    |

    When I select continue to step 2
    Then my choice of retailer will be selected

  Scenario: I try to find my local VW retailer by postcode and view in maps
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

  @clear_cookies
  Scenario: I leave the add a car flow
    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the I'm sure button
    Then I will be on the dashboard