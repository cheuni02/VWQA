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

  @login_dbg_history_plan_without_car @delete_all_cars @logout
  Scenario Outline: My service plane and history are displayed
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
    And my postcode is TS17 5BH
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type scirocco is displayed
    And my last added car name is My Scirocco

    When I scroll to my service history
    Then I will see my service history and plans details:
      | Service type  | Date       | Retailer                      |
      | Service Event | 07/01/2015 | Lookers Volkswagen (Teesside) |

    When I scroll to my plan
    Then I will see my plan details:
      | Plan                  | Start      | End        | Length    | More Info |
      | Fixed Price Servicing | 14/06/2014 | 13/06/2016 | 24 months | Read more |
    When I select read more link about my plan
    Then I will be on the correct page related to the Volkswagen service plans
    When I select browser back button

    And I scroll to my service guarantee
    Then I will see offered <guarantees>
    When I select find out more about <guarantees>
    Then I will be on the correct page related to the <guarantees>
    When I select browser back button
    Then I will be logged into my account

    Examples:
      | guarantees          |
      | Our service promise |
      | What we check & why |
      | Book a service      |

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
    And my postcode is EH15 3AJ
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

    When I scroll to my service history
    Then there is no service history for my car at present


    When I scroll to my plan
    Then I will see my plan details:
      | Plan                  | Start      | End        | Length    | More Info |
      | Fixed Price Servicing | 01/04/2014 | 31/03/2016 | 24 months | Read more |

    When I select read more link about my plan
    Then I will be on the correct page related to the Volkswagen service plans
    When I select browser back button
    Then I will be logged into my account

  @login_dbg_history_ext_without_car @delete_added_car @logout
  Scenario: My service history is displayed but no service plan
    Given I have added a new car to my account with:
      | Display name        | My Fox            |
      | Car status          | CURRENT           |
      | Registration        | CV10UDU           |
      | Model               | Fox               |
      | Derivative          | URBAN FOX 55      |
      | Registration date   | 2010-04-10        |
      | Fuel type           | Petrol            |
      | Vin                 | WVWZZZ5ZZA4124148 |
      | Year of manufacture | 2010              |
      | Engine capacity     | 1.2               |
      | Transmission        | Manual            |
      | Purchase type       | NEW_CAR           |
    And my postcode is SA12 9PT
    And I am on the Volkswagen Homepage

    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type fox is displayed
    And my last added car name is My Fox

    When I scroll to my service history
    Then I will see my service history and plans details:
      | Service type  | Date       | Retailer                          |
      | MOT Event     | 14/05/2015 | Sinclair Volkswagen (Port Talbot) |
      | Service Event | 09/04/2014 | Sinclair Volkswagen (Port Talbot) |
      | MOT Event     | 09/04/2014 | Sinclair Volkswagen (Port Talbot) |
    But I will see a show more button
    When I select the show more button
    Then I will see my service history and plans details:
      | Service type  | Date       | Retailer                          |
      | MOT Event     | 14/05/2015 | Sinclair Volkswagen (Port Talbot) |
      | Service Event | 09/04/2014 | Sinclair Volkswagen (Port Talbot) |
      | MOT Event     | 09/04/2014 | Sinclair Volkswagen (Port Talbot) |
      | Service Event | 02/04/2013 | Sinclair Volkswagen (Port Talbot) |
      | Service Event | 28/04/2012 | Sinclair Volkswagen (Port Talbot) |
      | Service Event | 29/03/2011 | Sinclair Volkswagen (Port Talbot) |

    When I scroll to my plan
    Then there is no volkswagen plans
    When I select I'm interested in fixed price servicing link
    Then I will be on the correct page related to the Fixed price servicing

  @login_dbg_nothing_without_car @delete_added_car @logout
  Scenario: I have no service plan or history
    Given I have added a new car to my account with:
      | Display name        | My Golf           |
      | Car status          | CURRENT           |
      | Registration        | LS10HXV           |
      | Model               | Golf              |
      | Derivative          | GOLF S            |
      | Registration date   | 2010-04-13        |
      | Fuel type           | Petrol            |
      | Vin                 | WVWZZZ1KZAW334053 |
      | Year of manufacture | 2010              |
      | Engine capacity     | 2.0               |
      | Transmission        | Manual            |
      | Purchase type       | NEW_CAR           |
    And my postcode is NW2 2AJ
    And I am on the Volkswagen Homepage
    When I login into my account
    Then I will be logged into my account
    And a default picture of my last added car type golf is displayed
    And my last added car name is My Golf

    When I scroll to my service history
    Then there is no service history for my car at present
    When I scroll to my plan
    Then there is no volkswagen plans
    When I select I'm interested in fixed price servicing link
    Then I will be on the correct page related to the Fixed price servicing