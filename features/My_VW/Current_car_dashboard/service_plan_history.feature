@my_vw @Current-Car-Dashboard
Feature: Current car dashboard - my service history and plans
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  @login_dbg_user_without_added_car @logout
  Scenario: No car added to my account
    Given I am on the Volkswagen Homepage
    When I login into my account
    Then I will be logged into my account
    And I will be welcomed to add a car as none are present for my account

  @login_dbg_user_without_added_car @delete_added_car
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
    When I select browser back button
    Then I will be logged into my account