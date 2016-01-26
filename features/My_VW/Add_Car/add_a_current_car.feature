@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to be able to add my current car to my account
  So that i can track and interact with my vehicle

  @login_single_car_user
  Scenario: Select add a car to my account
    Given I am on the Volkswagen Homepage
    When I login into my account
    And I go to add a new car
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

  Scenario: when I select A car I own and search for my registration
    When I select the A car I own button
    Then I will see a registration field
    But the Lookup button is disabled

    When I add a into the registration field
    Then the Lookup button is enabled

    When I lookup the registration
    Then I will see error message:
      | Feedback                                                                                         |
      | Sorry, but we don’t recognise that registration number. Please check it’s correct and try again. |

    When I add aa into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                            |
      | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW. |

    When I add CV54 VDF into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                            |
      | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW. |

    When I add VU12WGE into the registration field
    And I lookup the registration
    Then I will see my car details in summary:
      | Registration number | Model | Details                                           |
      | VU12WGE             | Up    | MOVE UP BLUEMOTION TECHNO, 2012, 1 Petrol, Manual |
    And acquired as will be set to A new car
    And my car will be called My Up by default

    When I select edit my car details
    Then I will see my car details in editable form:
      | Model | Derivative                | Year of Manufacture | Engine size | Fuel type | Transmission |
      | Up    | MOVE UP BLUEMOTION TECHNO | 2012                | 1           | Petrol    | Manual       |

    When I update model to Golf
    And I update derivative to GTD
    And I update year of manufacture to 2015
    And I update engine size to 2.0
    And I update fuel type to Diesel
    And I update transmission to Automatic
    And I update my car name to My Diesel Golf

    Then I will see my car details in editable form:
      | Model | Derivative | Year of Manufacture | Engine size | Fuel type | Transmission |
      | Golf  | GTD        | 2015                | 2.0         | Diesel    | Automatic    |


  Scenario: my searched for registration returns only partial details for my car
    When I add MM07AYJ into the registration field
    And I lookup the registration

    Then I will see my car details in editable form:
      | Model | Derivative      | Year of Manufacture | Engine size | Fuel type | Transmission |
      | Eos   | EOS SPORT T FSI |                     | 2           | Petrol    | Manual       |

  Scenario: I clear my car's name and attempt to move to the next step
    When I clear my car name
    And I select continue
    Then I will see my car name validation feedback Please complete car name


  Scenario: when I search for a car I have already added then I will not be able to add the car again
    When I add NL62CZM into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                                        |
      | Looks like you have this car added already. Go to My Cars to view it or search for another registration number. |

  @clear_cookies
  Scenario: when I search for a commercial vehicle I will not be able to add this to my account
    When I add SY64UCW into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                                        |
      | We're sorry we could not match your registration, the My Volkswagen login is only for passenger cars, if you have a Commercial Vehicle, Camper Van or Passenger Carrier, please visit https://volkswagen-vans.co.uk/ |
