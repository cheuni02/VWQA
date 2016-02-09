@my_vw @Add-Current-Car @login_single_car_user
Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to select a retailer to associate with my added car

  Scenario: I have completed step 1 and 2 and will see details of these steps
    Given I have successfully completed step 1 with registration KS64FVZ
    When I select continue to step 2
    And my previously chosen retailer Ipswich Volkswagen is preselected
    When I select continue to step 3

    Then I will see a summary of my car - step 1:
      | Registration number | Model  | Details                                              |
      | KS64FVZ             | Passat | PASSAT SE BUSINESS TDI BM, 2014, 2 Diesel, Automatic |
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

  Scenario: I update my car - step 1 details
    When I select change step 1
    Then I will see my car details in editable form:
      | Model  | Derivative                | Year of Manufacture | Date of registration | Engine size | Fuel type | Transmission |
      | Passat | PASSAT SE BUSINESS TDI BM | 2014                | 9/12/2014            | 2           | Diesel    | Automatic    |
    When I update engine size to 2.0
    And I update year of manufacture to 2015
    And I select continue
    Then I will see a summary of my car - step 1:
      | Registration number | Model  | Details                                                |
      | KS64FVZ             | Passat | PASSAT SE BUSINESS TDI BM, 2015, 2.0 Diesel, Automatic |
    And that my car was acquired as: A new car
    And that I named my car: My Passat
    And a change step 1 button is present

  Scenario: I change my retailer - step 2
    Given my previously chosen retailer Ipswich Volkswagen is preselected
    When I select the 1st retailer by name Leeds
    And I select continue
    Then I will see a summary of my retailer - step 2:
      | Retailer name    | Telephone number | Email address           |
      | Leeds Volkswagen | 0113 382 7600    | tribalddbtech@gmail.com |
    And a change step 2 button is present

  Scenario: I try to continue with no address details
    Given I will see a form to add my address details:
      | Field           | Mandatory | Value |
      | Postcode        | Yes       | empty |
      | House Name / no | Yes       | empty |
      | Address 1       | Yes       | empty |
      | Address 2       |           | empty |
      | Town / City     | Yes       | empty |
      | County          |           | empty |
    And I postcode lookup is disabled
    When I select Finish
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |
      | Please complete house number  |
      | Please complete address 1     |
      | Please complete town          |

  Scenario Outline: I attempt invalid postcode lookup
    When I enter Postcode with <postcode>
    Then I postcode lookup is enabled
    When I select lookup
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |

    Examples:
      | postcode |
      | X        |
      | AB1 1XC  |

  Scenario: I attempt valid postcode lookup
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

  Scenario: I attempt to go back but cancel
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

  Scenario: I change my retailer - step 2 and my previous details for step 3 are present
    When I select change step 2
    And I select continue
    Then I will see a form with my address details:
      | Field           | Mandatory | Value               |
      | Postcode        | Yes       | W2 6AA              |
      | House Name / no | Yes       | empty               |
      | Address 1       | Yes       | Bishops Bridge Road |
      | Address 2       |           | empty               |
      | Town / City     | Yes       | LONDON              |
      | County          |           | empty               |

  Scenario: I enter a invalid postcode after successful postcode lookup
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

  Scenario Outline: I attempt to complete my address with missing fields
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

  @delete_added_car @logout @clear_cookies
  Scenario: I skip and finnish step 3, I have successful added my car
    When I select Skip & Finish
    Then I will be on my car details summary
    And my car name My Passat is displayed
    And my retailer is Leeds Volkswagen is displayed

