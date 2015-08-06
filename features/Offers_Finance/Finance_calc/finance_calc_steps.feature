@Daily @finance_calc
Feature: Finance calculator - Step 1
  We need to make sure the customer is given correct and appropriate finance plan, so that it fits their budget
  Customer would just need to enter their deposit, average car mileage and preferred repayment time
  And the calculator do the rest. This step is just to enter the page


#    You can select a model from the list and the finance calculator loads in
#  Background: Showing the list of finance calculator models


  Scenario: navigating to each model's finance calculator page
    Given i navigate to the list of all available finance calculator models
    When user clicks on model from the displayed grid
    Then user should be navigated to the models finance calculator page

    #    Examples:
    #
    #    | model  |
    #    | New Passat |
    #    | up!    |
    #    | New Polo |
    #    | Golf |
    #    | Golf GTI / GTE / GTD / R |
    #    | e-Golf |
    #    | Golf Cabriolet |



#    You can change Trims/Derivatives within a given model
Scenario Outline: change Trims/Derivatives within a given model
  When user selects <trim_name> trim
  Then  trims finance page should show <trim_name> derivative above table

  Examples:

  | trim_name |
  | Rock up! |
  | High up! |
  | Move up! |
  | Take up! |




#    You can set the Deposit, Month etc parameters and the finance table updates successfully
Scenario: set the deposit.
  When user changes the value of the deposit to be "2,000.00" and presses update
  Then the deposit value is reflected on the table is "£2,000.00"

Scenario Outline: set the month
  When user clicks on <month> under my repayment time
  Then the duration field within the table should show month <month>

  Examples:

  | month |
  | 18 |
  | 24 |
  | 30 |
  | 36 |
  | 42 |
  | 48 |

Scenario Outline: set the car mileage
  When user clicks on <mileage> under average car mileage
  Then the average miles per year field within the table should show mileage <mileage>

  Examples:

  | mileage |
  | 5000 |
  | 10000 |
  | 15000 |
  | 20000 |
  | 25000 |
  | 30000 |
