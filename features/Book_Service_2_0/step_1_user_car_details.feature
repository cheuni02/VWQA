@my_vw @Service-Booking-2 @clear_cookies @login_Current_User
Feature: Booking A Car Service Step 1 car details
  We need to ensure we can enter our car details on the first step of registration
  So that customers can enter all the required details for a new car service

  Scenario: A user with a registered car books a service
    Given I am on the Volkswagen Homepage
    When I login into my account
    And I click the book a service button in navigation
    Then I should see step 1 of book a service
    And I will see my car details summary on step 1 with:
      | Trim            | Year of manufacture | Registration | Engine size | Fuel type | Transmission |
      | Test BEETLE 999 | 2012                | LM62HTT      | 1.8         | Petrol    | Manual       |
    But my car details are editable
    Then I will see my car details form populated with:
      | Model  | Trim            | Engine size | Year of manufacture | Transmission | Fuel type |
      | BEETLE | Test BEETLE 999 | 1.8         | 2012                | Manual       | Petrol    |

    When I select SCIROCCO18 from my list of vehicles
    Then I will see my car details form populated with:
      | Model    | Trim              | Engine size | Year of manufacture | Transmission | Fuel type |
      | SCIROCCO | Test SCIROCCO 999 | 1.8         | 2012                | Manual       | Petrol    |

    When I search for another car
    And I enter a vehicle valid VU12WGE
    And I click lookup button to find my registration
    Then I will see my car details form populated with:
      | Model | Trim                      | Engine size | Year of manufacture | Transmission | Fuel type |
      | Up    | MOVE UP BLUEMOTION TECHNO | 1           | 2012                | Manual       | Petrol    |

    When I select from my cars
    And I select JETTA13 from my list of vehicles
    Then I will see my car details form populated with:
      | Model | Trim           | Engine size | Year of manufacture | Transmission | Fuel type |
      | JETTA | Test JETTA 999 | 1.8         | 2012                | Manual       | Petrol    |

    And I select Next - My details
    Then I will see my car details summary populated with:
      | Trim           | Year of manufacture | Registration | Engine size | Fuel type | Transmission |
      | Test JETTA 999 | 2012                | LP15OVN      | 1.8         | Petrol    | Manual       |
