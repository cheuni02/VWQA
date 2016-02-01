@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to be able to add my current car to my account
  So that i can track and interact with my vehicle

  @login_Current_User @clear_cookies
  Scenario: I have logged into my VW account with max amount of current cars added
    Given I am on the Volkswagen Homepage
    When I login into my account
    And I go to add a new car
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

    When I select the A car I own button
    Then I will see a pop up informing me Car limit reached

    When I select ok
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

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

  Scenario: I search for a non VW car's registration
    When I add CV54 VDF into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                            |
      | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW. |

  Scenario: I search for a VW car's registration
    When I add KS64FVZ into the registration field
    And I lookup the registration
    Then I will see my car details in summary:
      | Registration number | Model  | Details                                              |
      | KS64FVZ             | Passat | PASSAT SE BUSINESS TDI BM, 2014, 2 Diesel, Automatic |
    And acquired as will be set to A new car
    And my car will be called My Passat by default

    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the Cancel button
    Then I will see my car details in summary:
      | Registration number | Model  | Details                                              |
      | KS64FVZ             | Passat | PASSAT SE BUSINESS TDI BM, 2014, 2 Diesel, Automatic |
    And acquired as will be set to A new car
    And my car will be called My Passat by default

    When I select edit my car details
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2014                | 9/12/2014            | 2           | Diesel    | Automatic    |

    When I update model to Golf
    And I update derivative to GTD
    And I update date of registration to 01/01/14
    And I update year of manufacture to 2015
    And I update engine size to 2.0
    And I update fuel type to Diesel
    And I update transmission to Automatic
    And I update my car name to My Diesel Golf

    Then I will see my car details in editable form:
      | Model | Derivative | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Golf  | GTD        | 2015                | 01/01/14             | 2.0         | Diesel    | Automatic    |

  Scenario: my searched for registration returns only partial details for my car
    When I add MM07AYJ into the registration field
    And I lookup the registration

    Then I will see my car details in editable form:
      | Model | Derivative      | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Eos   | EOS SPORT T FSI |                     | 29/06/2007           | 2           | Petrol    | Manual       |

    And I select continue
    Then I will see that my car details are incomplete with:
      | Feedback                            |
      | Please complete year of manufacture |

  Scenario: I clear all my other car details I will be given feedback
    When I clear model
    And I clear derivative
    And I clear engine size
    And I clear date of registration
    And I select continue
    Then I will see that my car details are incomplete with:
      | Feedback                             |
      | Please complete model                |
      | Please complete trim                 |
      | Please complete year of manufacture  |
      | Please complete date of registration |
      | Please complete engine size          |

  Scenario: I use the calender picker to select date of registration
    When I click the calender date picker
    And I choose year range 1930-1939
    Then I'm presented with all the years between 1929-1940
    When I choose year 1938
    Then I'm presented with all the months of 1938
    When I choose the month of Jan
    Then I'm presented with all the days of January 1938 between 1-31
    When I choose the 1st
    Then I will see date of registration is set to 01/01/1938

    When I click the calender date picker
    And I choose year range 2000-2009
    Then I'm presented with all the years between 1999-2010
    When I choose year 2004
    Then I'm presented with all the months of 2004
    When I choose the month of Feb
    Then I'm presented with all the days of February 2004 between 1-29
    When I choose the 29th
    Then I will see date of registration is set to 29/02/2004


  Scenario Outline: I partially update my car details I will be given feedback
    When I update model to <Model>
    And I update derivative to <Derivative>
    And I update engine size to <Engine size>
    And I update year of manufacture to <Year>
    And I update date of registration to <Date of registration>
    And I select continue
    Then I will see that my car details are incomplete with <Feedback>

    Examples:
      | Model | Derivative         | Date of registration | Engine size | Year | Feedback                             |
      | Up    | MOVE UP BLUEMOTION | 29/06/2007           | 1           |      | Please complete year of manufacture  |
      | Up    | MOVE UP BLUEMOTION |                      | 1           | 2015 | Please complete date of registration |
      | Up    | MOVE UP BLUEMOTION | 29/06/2007           |             | 2015 | Please complete engine size          |
      | Up    |                    | 29/06/2007           | 1           | 2015 | Please complete trim                 |
      |       | MOVE UP BLUEMOTION | 29/06/2007           | 1           | 2015 | Please complete model                |

  Scenario: I clear my car's name and attempt to move to the next step
    When I clear my car name
    And I select continue
    Then I will see my car name validation feedback Please complete car name

  Scenario: I set my car's name to one used for another car on my account
    When I update my car name to GOLF
    And I select continue
    Then I will see my car name validation feedback Looks like you have a car with this name already. Please enter a different name.

  Scenario: when I search for a car I have already added then I will not be able to add the car again
    When I add NL62CZM into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                                        |
      | Looks like you have this car added already. Go to My Cars to view it or search for another registration number. |

  Scenario: when I search for a commercial vehicle I will not be able to add this to my account
    When I add SY64UCW into the registration field
    And I lookup the registration
    Then I will see error message:
      | Feedback                                                                                                                                                                                                             |
      | We're sorry we could not match your registration, the My Volkswagen login is only for passenger cars, if you have a Commercial Vehicle, Camper Van or Passenger Carrier, please visit https://volkswagen-vans.co.uk/ |

  @clear_cookies
  Scenario: I leave the add a car flow
    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the I'm sure button
    Then I will be on the dashboard