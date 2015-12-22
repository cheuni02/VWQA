@my_vw @Service-Booking-2
Feature: Booking A Car Service Step 1 car details
  We need to ensure we can enter our car details on the first step of registration
  So that customers can enter all the required details for a new car service

  Scenario: Guest books a service
    Given I am on the Volkswagen Homepage
    When I click the book a service button in the navigation
    Then I should see step 1 of book a service
    And I can not continue until I enter a vehicle registration

  Scenario Outline: Guest adds invalid registration
    Given I enter a vehicle invalid <Registration>
    When I click lookup button to find my registration
    Then I will see feedback that my car details are incorrect with:
      | Feedback                                                                                        |
      | Sorry, we couldn't find that registration. Please try again or enter your vehicle details below |
    And I will see a form to enter my car details

    Examples:
      | Registration |
      | CV54 VDF     |
      | XXXXXXX      |

  Scenario: Guest tries to move onto next step without completing all their car details form
    Given I clear the vehicle Registration field
    When I select Next - My details
    Then I will see feedback that my car details are incomplete with:
      | Feedback                                       |
      | Please provide your registration number        |
      | Please let us know what model of car you drive |
      | Please let us know your car derivative         |
      | Please complete engine size                    |
      | Please let us know the year of the car         |
      | Please let us know the cars transmission       |
      | Please let us know the cars fuel type          |

  Scenario Outline: Guest tries to move onto next step without completing some of their car details form
    Given I enter a vehicle valid <Registration>
    When I add the Model field with <Model>
    When I add the Trim field with <Trim>
    And I add the Engine size field with <Engine size>
    And I add the Year of manufacture field with <Year of manufacture>
    And I set the transmission to <transmission>
    And I set the fuel type to <fuel type>
    When I select Next - My details
    Then I will see car details are incomplete with <Feedback>

    Examples:
      | Registration | Model | Trim    | Engine size | Year of manufacture | transmission | fuel type | Feedback                                       |
      | VU12WGE      | Up    | MOVE UP | 1           | 2012                |              |           | Please let us know the cars transmission       |
      | VU12WGE      | Up    | MOVE UP | 1           | 2012                | Manual       |           | Please let us know the cars fuel type          |
      |              | Up    | MOVE UP | 1           | 2012                | Manual       | Petrol    | Please provide your registration number        |
      | VU12WGE      |       | MOVE UP | 1           | 2012                | Manual       | Petrol    | Please let us know what model of car you drive |
      | VU12WGE      | Up    |         | 1           | 2012                | Manual       | Petrol    | Please let us know your car derivative         |
      | VU12WGE      | Up    | MOVE UP |             | 2012                | Manual       | Petrol    | Please complete engine size                    |
      | VU12WGE      | Up    | MOVE UP | 1           |                     | Manual       | Petrol    | Please let us know the year of the car         |

  Scenario Outline: Guest adds valid registration
    Given I enter a vehicle valid <Registration>
    When I click lookup button to find my registration
    Then I will see a form to update my car details
    And I will see my car <Model>, <Trim>, <Engine size>, <Year of manufacture>, <Transmission>, <Fuel type>

    Examples:
      | Registration | Model | Trim                      | Engine size | Year of manufacture | Transmission | Fuel type |
      | VU12WGE      | Up    | MOVE UP BLUEMOTION TECHNO | 1           | 2012                | Manual       | Petrol    |
      | FE06KHO      | Golf  | GOLF PLUS SE TDI          | 1.9         | 2006                | Manual       | Diesel    |
      | YM14YOX      | Golf  | GOLF GTI PERFORMANCE      | 2           | 2014                | Manual       | Petrol    |
      | V5VWU        | Bora  | BORA V5                   | 2           | 2000                | Manual       | Petrol    |

  Scenario: Guest updates populated car details
    Given I will see a form to update my car details
    When I update the Trim field with BORA S TDI
    And I update the Engine size field with 1.9
    And I update the Year of manufacture field with 2001
    And I set the transmission to Automatic
    And I set the fuel type to Diesel
    Then I will see my car details form populated with:
      | Model | Trim       | Engine size | Year of manufacture | Transmission | Fuel type |
      | Bora  | BORA S TDI | 1.9         | 2001                | Automatic    | Diesel    |

  Scenario: Guest selects next
    When I select Next - My details
    Then I will see my car details summary populated with:
      | Trim       | Year of manufacture | Registration | Engine size | Fuel type | Transmission |
      | BORA S TDI | 2001                | V5VWU        | 1.9         | Diesel    | Automatic    |

  Scenario: Guest is interested in a service plan
    Given I select change my car details
    And I will see a form to update my car details
    When I select that I'm interested in a service plan
    And I select Next - My details
    Then I will see more info details in summary as:
      | Service Plan                                                                                             | Extended warranty | Leased with |
      | I'm interested in a service plan. Please call me to discuss options so I can start saving straight away. | no                | no          |

  Scenario: Guest adds a service plan
    Given I select change my car details
    And I will see a form to update my car details
    When I select that I have a service plan
    Then the option for I'm interested in a service plan will disappear
    And I select Next - My details
    Then I will see more info details in summary as:
      | Service Plan | Extended warranty | Leased with |
      | yes          | no                | no          |

  Scenario: Guest adds extended warranty
    Given I select change my car details
    And I will see a form to update my car details
    When I select that I have a extended warranty
    And I select Next - My details
    Then I will see more info details in summary as:
      | Service Plan | Extended warranty | Leased with |
      | yes          | yes               | no          |

  Scenario: Guest adds that they lease their car
    Given I select change my car details
    And I will see a form to update my car details
    When I select that I lease my car
    And I select Next - My details
    Then I will see feedback for more info Please enter a lease company
    When I provide a lease company Leasing Company
    And I select Next - My details
    Then I will see more info details in summary as:
      | Service Plan | Extended warranty | Leased with     |
      | yes          | yes               | Leasing Company |

  Scenario: Guest car details are still populated
    When I select change my car details
    Then I will see a form to update my car details
    And I will see my car details form populated with:
      | Model | Trim       | Engine size | Year of manufacture | Transmission | Fuel type |
      | Bora  | BORA S TDI | 1.9         | 2001                | Automatic    | Diesel    |


  Scenario Outline: Guest adds their car's approximate mileage
    When I fill in the approximate <Mileage> under more info
    And I select Next - My details
    Then I will see feedback for more info Please enter a valid number

    Examples:
      | Mileage |
      | 20,000  |
      | 20.000  |
      | 20_000  |
      | -20000  |
      | 123abc  |

