@my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car


  Background: Current car dashboard
    Given a car with registration NU61OJG and display name My Golf is added to my account
    But there is no address for my account
    And my details will still be the same:
      | Field           | Value |
      | Postcode        | empty |
      | House Name / no | empty |
      | Address 1       | empty |
      | Address 2       | empty |
      | Town / City     | empty |
      | County          | empty |
    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

  @login_dbg_history_plan_without_car @delete_all_cars @clear_cookies @clear_address
  Scenario: I successfully update my address
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

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

    When I enter House Name with 12a
    And I select Update

    Then I will see my car dashboard
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf
    And my details will still be successfully updated to:
      | Field           | Value            |
      | Postcode        | TS17 5BH         |
      | House Name / no | 12a              |
      | Address 1       | Hillmorton Road  |
      | Address 2       | Ingleby Barwick  |
      | Town / City     | STOCKTON-ON-TEES |
      | County          | Cleveland        |

    And I will see my service history and plans details:
      | Service type  | Date       | Retailer                      |
      | Service Event | 07/01/2015 | Lookers Volkswagen (Teesside) |

    When I scroll to my plan
    Then I will see my plan details:
      | Plan                  | Start      | End        | Length    | More Info |
      | Fixed Price Servicing | 14/06/2014 | 13/06/2016 | 24 months | Read more |

  @login_dbg_history_plan_without_car @delete_all_cars @clear_cookies @clear_address
  Scenario: I unsuccessfully get a DBG match for my address
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

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
    And I select Update
    Then I will see a pop with Sorry, that didn't work:
      | The address you entered has been saved to your account but it doesn't match our records. If you continue to have problems, please give us a call on 0800 0833 914. |
    When I dismiss the pop up

    Then I'm asked for Just a few details from you... to update my address
    And my details will still be successfully updated to:
      | Field           | Value              |
      | Postcode        | CV47 2RB           |
      | House Name / no | The old school     |
      | Address 1       | Chapel Street      |
      | Address 2       | Bishops Itchington |
      | Town / City     | SOUTHAM            |
      | County          | Warwickshire       |

  @login_dbg_history_plan_without_car @delete_added_car @clear_cookies
  Scenario: Service plan or history is not shown until correct address is supplied
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

    And I will see a form to add my address details:
      | Field           | Mandatory | Value |
      | Postcode        | Yes       | empty |
      | House Name / no | Yes       | empty |
      | Address 1       | Yes       | empty |
      | Address 2       |           | empty |
      | Town / City     | Yes       | empty |
      | County          |           | empty |
    And postcode lookup is disabled

    When I select Update
    Then I will see address error message:
      | Feedback                      |
      | Please enter a valid postcode |
      | Please complete house number  |
      | Please complete address 1     |
      | Please complete town          |

    When I enter Postcode with CH5 3QW
    Then postcode lookup is enabled

    And I select lookup
    Then I will see a form with my address details:
      | Field           | Mandatory | Value                             |
      | Postcode        | Yes       | CH5 3QW                           |
      | House Name / no | Yes       | empty                             |
      | Address 1       | Yes       | Manor Lane                        |
      | Address 2       |           | Hawarden Industrial Park,Hawarden |
      | Town / City     | Yes       | DEESIDE                           |
      | County          |           | Clwyd                             |

    When I select Update
    Then I will see address error message:
      | Feedback                     |
      | Please complete house number |

    And my details will still be the same:
      | Field           | Value |
      | Postcode        | empty |
      | House Name / no | empty |
      | Address 1       | empty |
      | Address 2       | empty |
      | Town / City     | empty |
      | County          | empty |

  @login_dbg_history_plan_without_car @delete_added_car @clear_cookies
  Scenario: Leaving address capture page will return me to my current car dashboard
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

    When I select the back button
    Then I will see my car dashboard
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

  @login_dbg_history_plan_without_car @clear_cookies
  Scenario: Deleting my current car while on address capture page and then leaving will return me to my account details page
    Given I scroll to my service history and plans
    Then I will see a message Please check or update your address to enable this feature in service history and plans section

    When I click on enable service history feature
    Then I'm asked for Just a few details from you... to update my address

    When I delete my current car in the background

    And I select the back button
    Then I am viewing My account

