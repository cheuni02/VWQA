#@my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

  @login_dbg_history_plan_without_car @delete_added_car @logout
  Scenario: Service plan or history is not shown until correct address is supplied
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
    But there is no address for my account
    When I login into my account
    Then I will be logged into my account

    Given I scroll to my service history
    Then I will see a message Please check or update your address to enable this feature in history section

    When I click on enable service history feature




