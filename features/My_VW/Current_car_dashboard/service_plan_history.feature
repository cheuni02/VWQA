@my_vw @Current-Car-Dashboard
Feature: Current car dashboard - my service history and plans
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  @login_dbg_history_plan_without_car @logout
  Scenario: No car added to my account
    Given I am on the Volkswagen Homepage
    When I login into my account
    Then I will be logged into my account
    And I will be welcomed to add a car as none are present for my account

  @login_dbg_history_plan_without_car @delete_added_car @logout
  Scenario: My service plane and history are displayed
    Given I have added a new car to my account with:
      | Display name        | My Scirocco               |
      | Car status          | CURRENT                   |
      | Registration        | NU61OJG                   |
      | Model               | Scirocco                  |
      | Derivative          | SCIROCCO GT BLUEMOTN TECH |
      | Registration date   | 2011-10-28                |
      | Fuel type           | Diesel                    |
      | Vin                 | WVWZZZ13ZCV003370         |
      | Year of manufacture | 2011                      |
      | Engine capacity     | 2.0                       |
      | Transmission        | Manual                    |
      | Purchase type       | NEW_CAR                   |
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type scirocco is displayed
    And my last added car name is My Scirocco

    When I scroll to my service history and plans
    Then I will see my service history and plans details:
      | Service type  | Date       | Retailer                      | EVC report |
      | Service Event | 07/01/2015 | Lookers Volkswagen (Teesside) |            |

    When I scroll to my plan
    Then I will see my plan details:
      | Plan                  | Start      | End        | Length    | More Info |
      | Fixed Price Servicing | 14/06/2014 | 13/06/2016 | 24 months | Read more |

    When I select read more link about my plan
    Then I will be on the correct page related to the Fixed price servicing



  @login_dbg_plan_without_car @delete_added_car @logout
  Scenario: My service plane is displayed but no history
    Given I have added a new car to my account with:
      | Display name        | My Golf           |
      | Car status          | CURRENT           |
      | Registration        | NL59XEM           |
      | Model               | Golf              |
      | Derivative          | GOLF SE TSI       |
      | Registration date   | 2009-10-21        |
      | Fuel type           | Petrol            |
      | Vin                 | WVWZZZ1KZAW160478 |
      | Year of manufacture | 2009              |
      | Engine capacity     | 1.4               |
      | Transmission        | Manual            |
      | Purchase type       | NEW_CAR           |
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

    When I scroll to my service history and plans
    Then there is no service history for my car at present

    When I scroll to my plan
    Then I will see my plan details:
      | Plan                  | Start      | End        | Length    | More Info |
      | Fixed Price Servicing | 01/04/2014 | 31/03/2016 | 24 months | Read more |

    When I select read more link about my plan
    Then I will be on the correct page related to the Fixed price servicing
    When I select browser back button
    Then I will be logged into my account

  @login_dbg_history_without_car @delete_added_car @logout
  Scenario: My service history is displayed but no service plan
    Given I have added a new car to my account with:
      | Display name        | My Scirocco               |
      | Car status          | CURRENT                   |
      | Registration        | YG61RXC                   |
      | Model               | Scirocco                  |
      | Derivative          | SCIROCCO GT BLUEMOTN TECH |
      | Registration date   | 2011-10-17                |
      | Fuel type           | Diesel                    |
      | Vin                 | WVWZZZ13ZCV003235         |
      | Year of manufacture | 2011                      |
      | Engine capacity     | 2.0                       |
      | Transmission        | Manual                    |
      | Purchase type       | NEW_CAR                   |
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type scirocco is displayed
    And my last added car name is My Scirocco

    When I scroll to my service history and plans
    Then I will see my service history and plans details:
      | Service type  | Date       | Retailer                | EVC report |
      | MOT Event     | 17/10/2014 | Huddersfield Volkswagen |            |
      | Service Event | 19/05/2014 | Huddersfield Volkswagen |            |
      | Service Event | 11/07/2012 | Huddersfield Volkswagen |            |

    When I scroll to my plan
    Then there is no volkswagen plans
    When I select I'm interested in fixed price servicing link
    Then I will be on the correct page related to the Fixed price servicing
