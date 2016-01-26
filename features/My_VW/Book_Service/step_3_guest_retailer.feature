@my_vw @Service-Booking-2
Feature: Service booking Step 3 Retailer
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 and Step 2 in book a service and be taken to Step 3
  where I will need to find my local retailer

  Scenario: as a guest I have completed Step 1, 2 and my details are present in summary
    Given I have completed Step 1
    When I select Next - My details
    Then Step 2 of book a service has loaded
    When I have completed Step 2
    And I select Next - Select retailer
    Then Step 3 of book a service has loaded

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

  Scenario: I try to find my local VW retailer by name of local town
    When I search for my local VW retailer by location with berlin
    And I click lookup
    Then I will see message that no retailers found matching my search

    When I search for my local VW retailer by location with bath
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers

    When I select the 2nd local retailer
    Then my choice of retailer will be selected

    When I select the 3nd local retailer
    Then my choice of retailer will be selected

  Scenario: I try to find my local VW retailer by postcode
    When I search for my local VW retailer by location with VX4 5BQ
    And I click lookup
    Then I will see message that no retailers found matching my search

    When I search for my local VW retailer by location with M34 5GH
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers

    When I select the 5th local retailer
    Then my choice of retailer will be selected

    When I search for my local VW retailer by location with AL5
    And I click lookup
    Then I'm presented with a list view of 5 local VW dealers

    When I select the 4th local retailer
    Then my choice of retailer will be selected