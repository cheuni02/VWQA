@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to be able to add my current car to my account
  So that i can track and interact with my vehicle

  @login_Current_User @clear_cookies
  Scenario: I have logged into my VW account with max amount of current cars added
    Given I am on the Volkswagen Homepage
    When I login into my account
    Then I will be logged into my account
    When I go to add a new car
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

  @add_car_user
  Scenario: Select add a car to my account
    Given I'm logged into my account
    When I go to add a new car
    Then I will be on add a car section with options:
      | I'd like to add  |
      | A car I own      |
      | A car I ordered  |
      | A configured car |
    But none will be set

  @add_car_user
  Scenario Outline: Invalid search for registration
    Given I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    Then I will see a registration field
    But the Lookup button is disabled
    When I add <registration> into the registration field
    Then the Lookup button is enabled
    When I lookup the registration
    Then I will see registration field error <message>

    Examples:
      | registration | message                                                                                             |
      | a            | Sorry, but we don’t recognise that registration number. Please check it’s correct and try again.    |
      | aa           | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW. |
      | CV54VDF      | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW. |

  @add_car_user @delete_added_car
  Scenario Outline: After successful search for registration, I try again with invalid search for registration
    Given a car with registration EJ62MMO and display name Golf is added to my account
    And I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    Then I will see a registration field

    When I add SA04BGW into the registration field
    And I lookup the registration
    Then I will see my car details in summary:
      | Registration number | Model   | Details                                       |
      | SA04BGW             | Touareg | TOUAREG TDI AUTO, 2004, 2.5 Diesel, Automatic |
    And acquired as will be set to A new car
    And my car will be called My Touareg by default

    When I add <registration> into the registration field
    And I lookup the registration
    Then I will see registration field error <message>
    And I will see my car details in editable form with no details:
      | in the these fields     |
      | Model                   |
      | Trim                    |
      | Date of registration    |
      | Year of manufacture     |
      | Engine size             |
      | I'd like to call my car |
    And I will see that none of these:
      | options are selected |
      | Fuel type            |
      | Transmission         |
    But acquired as will be set to A new car

    Examples:
      | registration | message                                                                                                                                                                                                              |
      | EJ62MMO      | Looks like you have this car added already. Go to My Cars to view it or search for another registration number.                                                                                                      |
      | SY64UCW      | We're sorry we could not match your registration, the My Volkswagen login is only for passenger cars, if you have a Commercial Vehicle, Camper Van or Passenger Carrier, please visit https://volkswagen-vans.co.uk/ |
      | CV54VDF      | Looks like your registration doesn’t belong to a Volkswagen. You can only add Volkswagens to My VW.                                                                                                                  |

  @add_car_user
  Scenario: After successful registration search I think about not adding my car
    Given I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    And I add ML15XHR into the registration field
    And I lookup the registration
    Then I will see my car details in summary:
      | Registration number | Model  | Details                                             |
      | ML15XHR             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Manual |
    And acquired as will be set to A new car
    And my car will be called My Passat by default

    When I select the back button
    Then I will see popup asking Are you sure you want to leave?

    When I select the Cancel button
    Then I will see my car details in summary:
      | Registration number | Model  | Details                                             |
      | ML15XHR             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Manual |
    And acquired as will be set to A new car
    And my car will be called My Passat by default

    When I select the logout button
    Then I will see popup asking Are you sure you want to leave?
    When I select the Cancel button
    Then I will see my car details in summary:
      | Registration number | Model  | Details                                             |
      | ML15XHR             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Manual |
    And acquired as will be set to A new car
    And my car will be called My Passat by default

    When I select the back button
    Then I will see popup asking Are you sure you want to leave?
    When I select the I'm sure button
    Then I will be on the dashboard

  @add_car_user
  Scenario Outline: After successful registration search I update my car details
    Given I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    And I add MM07AYJ into the registration field
    And I lookup the registration
    Then I will see my car details in editable form:
      | Model | Derivative      | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Eos   | EOS SPORT T FSI |                     | 29/06/2007           | 2.0         | Petrol    | Manual       |

    When I update model to <Model>
    And I update derivative to <Derivative>
    And I update engine size to <Engine size>
    And I update year of manufacture to <Year>
    And I update date of registration to <Date of registration>
    And I select continue to step 2
    Then I will see that my car details are incomplete with <Feedback>

    Examples:
      | Model | Derivative         | Date of registration | Engine size | Year | Feedback                             |
      | Up    | MOVE UP BLUEMOTION | 29/06/2007           | 1.0         |      | Please complete year of manufacture  |
      | Up    | MOVE UP BLUEMOTION |                      | 1.0         | 2015 | Please complete date of registration |
      | Up    | MOVE UP BLUEMOTION | 29/06/2007           |             | 2015 | Please complete engine size          |
      | Up    |                    | 29/06/2007           | 1.0         | 2015 | Please complete trim                 |
      |       | MOVE UP BLUEMOTION | 29/06/2007           | 1.0         | 2015 | Please complete model                |

  @add_car_user
  Scenario Outline: I use the calender picker to select date of registration
    Given I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    And I add ML15XHR into the registration field
    And I lookup the registration
    And I select edit my car details
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2015                | 27/04/2015           | 2.0         | Diesel    | Manual       |

    When I click the calender date picker
    And I choose a decade <year range>
    Then I'm presented with all the years between <selected year range>
    When I <select year> in chosen decade
    Then I'm presented with all the months of <select year>
    When I <select month> in the chosen year
    Then I'm presented with all the days of <selected month year> between <selected month days>
    When I choose the <select day>
    Then I will see my choice of <registration date> is set

    Examples:
      | year range | selected year range | select year | select month | selected month year | selected month days | select day | registration date |
      | 1930-1939  | 1929-1940           | 1938        | Jan          | January 1938        | 1-31                | 1st        | 01/01/1938        |
      | 2000-2009  | 1999-2010           | 2004        | Feb          | February 2004       | 1-29                | 29th       | 29/02/2004        |

  @add_car_user @delete_added_car
  Scenario Outline: I set my car's name to one used for another car on my account
    Given a car with registration EJ62MMO and display name Golf is added to my account
    And I'm logged into my account
    When I go to add a new car
    And I select the A car I own button
    And I add ML15XHR into the registration field
    And I lookup the registration
    When I update my car name to <display name>
    And I select continue to step 2
    Then I will see my car name validation feedback <message>

    Examples:
      | display name | message                                                                          |
      |              | Please complete car name                                                         |
      | GOLF         | Looks like you have a car with this name already. Please enter a different name. |
      | Golf         | Looks like you have a car with this name already. Please enter a different name. |
      | golf         | Looks like you have a car with this name already. Please enter a different name. |

