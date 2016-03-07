@my_vw @Add-Current-Car
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to add my address to associate with my account

  @add_car_user @clear_cookies @delete_all_cars
  Scenario: I try to add two cars concurrently while being near the limit of maximum cars on my account
    Given I have 24 cars in my account
    And I have successfully completed step 1 with registration ML15XHR
    When I select continue to step 2
    And a car with registration SB63YSK and display name My Golf is added to my account
    And I select continue to step 3
    And I select Finish
    Then I will see a pop up informing me Car limit reached
    When I select ok
    And I select Skip & Finish
    Then I will see a pop up informing me Car limit reached
    When I select ok

  @login_dbg_history_plan_without_car @delete_added_car @clear_cookies @clear_address
  Scenario: I add my new car, select a retailer and add my address successfully
    Given I do not have an address associated with my account
    And I have successfully completed step 1 with registration NU61OJG
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with TS17 5BH
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value            |
      | Postcode        | Yes       | TS17 5BH         |
      | House Name / no | Yes       | empty            |
      | Address 1       | Yes       | Hillmorton Road  |
      | Address 2       |           | Ingleby Barwick  |
      | Town / City     | Yes       | STOCKTON-ON-TEES |
      | County          |           | Cleveland        |
    When I enter House Name with 12
    And I select Finish
    Then I will see my car dashboard
    And a default picture of my last added car type scirocco is displayed
    And my last added car name is My Scirocco
    When I scroll to my preferred retailer
    Then my retailer is Ipswich Volkswagen is displayed

  @add_car_user @clear_address
  Scenario: I have completed step 1 and 2 and will see details of these steps
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    Then I will see a summary of my car - step 1:
      | Registration number | Model  | Details                                             |
      | ML15XHR             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Manual |
    And that my car was acquired as: A new car
    And that I named my car: My Passat
    And a change step 1 button is present

    And I will see a summary of my retailer - step 2:
      | Retailer name      | Telephone number | Email address           |
      | Ipswich Volkswagen | 01473 240800     | tribalddbtech@gmail.com |
    And a change step 2 button is present

    And I will see a form to add my address details:
      | Field           | Mandatory | Value |
      | Postcode        | Yes       | empty |
      | House Name / no | Yes       | empty |
      | Address 1       | Yes       | empty |
      | Address 2       |           | empty |
      | Town / City     | Yes       | empty |
      | County          |           | empty |
    And postcode lookup is disabled
    When I select Finish
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |
      | Please complete house number  |
      | Please complete address 1     |
      | Please complete town          |

  @add_car_user
  Scenario: I update my car - step 1 details
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I select change step 1
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2015                | 27/04/2015           | 2.0         | Diesel    | Manual       |
    When I update engine size to 2
    And I update year of manufacture to 2015
    And I select continue
    Then I will see a summary of my car - step 1:
      | Registration number | Model  | Details                                             |
      | ML15XHR             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Manual |
    And that my car was acquired as: A new car
    And that I named my car: My Passat
    And a change step 1 button is present

  @add_car_user @clear_address
  Scenario: I change my retailer - step 2
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    Then I will see a summary of my retailer - step 2:
      | Retailer name      | Telephone number | Email address           |
      | Ipswich Volkswagen | 01473 240800     | tribalddbtech@gmail.com |

    When I enter Postcode with W2 6AA
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

    When I select change step 2
    Then my previously chosen retailer Ipswich Volkswagen is preselected

    When I select the 1st retailer by name Leeds
    And I select continue
    Then I will see a summary of my retailer - step 2:
      | Retailer name    | Telephone number | Email address           |
      | Leeds Volkswagen | 0113 382 7600    | tribalddbtech@gmail.com |
    And a change step 2 button is present

    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

  @add_car_user
  Scenario Outline: I attempt invalid postcode lookup
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with <postcode>
    Then postcode lookup is enabled
    When I select lookup
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |

    Examples:
      | postcode |
      | XX       |
      | AB1 1XC  |

  @add_car_user @clear_address
  Scenario: I attempt valid postcode lookup
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with W2 6AA
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

    When I select Finish
    Then I will see address error message:
      | Feedback                     |
      | Please complete house number |

  @add_car_user
  Scenario: I attempt to go back but cancel
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with W2 6AA
    And I select lookup
    When I select the back button
    Then I will see popup asking Are you sure you want to leave?
    When I select the Cancel button
    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

  @add_car_user
  Scenario: I enter a invalid postcode after successful postcode lookup
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with W2 6AA
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

    When I enter Postcode with AB1 1XC
    And I select lookup
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |

    And I will see a form with my address details:
      | Field           | Mandatory | Value   |
      | Postcode        | Yes       | AB1 1XC |
      | House Name / no | Yes       | empty   |
      | Address 1       | Yes       | empty   |
      | Address 2       |           | empty   |
      | Town / City     | Yes       | empty   |
      | County          |           | empty   |

  @add_car_user @clear_address
  Scenario Outline: I attempt to complete my address with missing fields
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with <postcode>
    When I enter House Name with <house name>
    When I enter Address 1 with <address 1>
    When I enter Town with <town>
    And I select Finish
    Then I will see address error message with <feedback>

    Examples:
      | postcode | house name | address 1   | town      | feedback                      |
      |          | 28         | High Street | Godalming | Please enter a valid postcode |
      | GU7 1DZ  |            | High Street | Godalming | Please complete house number  |
      | GU7 1DZ  | 28         |             | Godalming | Please complete address 1     |
      | GU7 1DZ  | 28         | High Street |           | Please complete town          |

  @add_car_user @clear_address
  Scenario: I attempt to finish change of address but there is no DBG match
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Ipswich
    And I select continue to step 3
    When I enter Postcode with BS23 3YZ
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value             |
      | Postcode        | Yes       | BS23 3YZ          |
      | House Name / no | Yes       | empty             |
      | Address 1       | Yes       | Marchfields Way   |
      | Address 2       |           | empty             |
      | Town / City     | Yes       | WESTON-SUPER-MARE |
      | County          |           | Avon              |
    When I select Finish
    Then I will see address error message:
      | Feedback                     |
      | Please complete house number |
    When I enter House Name with 12
    And I select Finish
    Then I will see a pop with Sorry, that didn't work:
      | The address you entered has been saved to your account but it doesn't match our records. If you continue to have problems, please give us a call on 0800 0833 914. |
    When I dismiss the pop up
    Then I will not see any error messages
    And I will see a form with my address details:
      | Field           | Mandatory | Value             |
      | Postcode        | Yes       | BS23 3YZ          |
      | House Name / no | Yes       | 12                |
      | Address 1       | Yes       | Marchfields Way   |
      | Address 2       |           | empty             |
      | Town / City     | Yes       | WESTON-SUPER-MARE |
      | County          |           | Avon              |
    When I enter Postcode with BS23 3YZ
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value |
      | House Name / no | Yes       | empty |
#
  @add_car_user @delete_added_car @logout @clear_cookies @clear_address
  Scenario: I skip and finnish step 3, I have successful added my car
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Leeds
    And I select continue to step 3
    When I select Skip & Finish
    Then I will see my car dashboard
    And a default picture of my last added car type passat is displayed
    And my last added car name is My Passat
    When I scroll to my preferred retailer
    Then my retailer is Leeds Volkswagen is displayed

  @add_car_user @clear_address @clear_cookies
  Scenario: I select finish but without DBG match
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Bath
    When I select continue to step 3
    And I will see a form to add my address details:
      | Field           | Mandatory | Value |
      | Postcode        | Yes       | empty |
      | House Name / no | Yes       | empty |
      | Address 1       | Yes       | empty |
      | Address 2       |           | empty |
      | Town / City     | Yes       | empty |
      | County          |           | empty |
    When I enter Postcode with CV47 2RB
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value              |
      | Postcode        | Yes       | CV47 2RB           |
      | House Name / no | Yes       | empty              |
      | Address 1       | Yes       | Chapel Street      |
      | Address 2       |           | Bishops Itchington |
      | Town / City     | Yes       | SOUTHAM            |
      | County          |           | Warwickshire       |
    When I enter House Name with The old school
    And I select Finish
    Then I will see a pop with Sorry, that didn't work:
      | The address you entered has been saved to your account but it doesn't match our records. If you continue to have problems, please give us a call on 0800 0833 914. |
    When I dismiss the pop up
    But my details will still be successfully updated to:
      | Field           | Value              |
      | Postcode        | CV47 2RB           |
      | House Name / no | The old school     |
      | Address 1       | Chapel Street      |
      | Address 2       | Bishops Itchington |
      | Town / City     | SOUTHAM            |
      | County          | Warwickshire       |

  @add_car_user @clear_address @delete_added_car
  Scenario: I select skip & finish my address details are not updated
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Bath
    When I select continue to step 3
    And I will see a form to add my address details:
      | Field           | Mandatory | Value |
      | Postcode        | Yes       | empty |
      | House Name / no | Yes       | empty |
      | Address 1       | Yes       | empty |
      | Address 2       |           | empty |
      | Town / City     | Yes       | empty |
      | County          |           | empty |
    When I enter Postcode with CV47 2RB
    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value              |
      | Postcode        | Yes       | CV47 2RB           |
      | House Name / no | Yes       | empty              |
      | Address 1       | Yes       | Chapel Street      |
      | Address 2       |           | Bishops Itchington |
      | Town / City     | Yes       | SOUTHAM            |
      | County          |           | Warwickshire       |
    When I enter House Name with The old school
    And I select Skip & Finish
    Then I will see my car dashboard
    And a default picture of my last added car type passat is displayed
    Then my last added car name is My Passat
    But my details will still be the same:
      | Field           | Value |
      | Postcode        | empty |
      | House Name / no | empty |
      | Address 1       | empty |
      | Address 2       | empty |
      | Town / City     | empty |
      | County          | empty |

  @login_complete_details_user @logout @clear_cookies
  Scenario: I have already provided my address which doesn't match with VW records
    Given I have successfully completed step 1 with registration ML15XHR
    And I have chosen my retailer as Bath
    When I select continue to step 3
    Then I will see a form with my address details:
      | Field           | Mandatory | Value        |
      | Postcode        | Yes       | UB6 7HA      |
      | House Name / no | Yes       | 4000         |
      | Address 1       | Yes       | Empire Road  |
      | Address 2       |           | Empire Place |
      | Town / City     | Yes       | LONDON       |
      | County          |           | MIDDLESEX    |
    When I select Finish
    Then I will see a pop with Sorry, that didn't work:
      | The address you entered has been saved to your account but it doesn't match our records. If you continue to have problems, please give us a call on 0800 0833 914. |
    But my details will still be the same:
      | Field           | Value        |
      | Postcode        | UB6 7HA      |
      | House Name / no | 4000         |
      | Address 1       | Empire Road  |
      | Address 2       | Empire Place |
      | Town / City     | LONDON       |
      | County          | MIDDLESEX    |