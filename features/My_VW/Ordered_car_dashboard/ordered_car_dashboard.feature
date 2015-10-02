@ordered_car @Daily
Feature: Ordered car dashboard
  As a user who has just orderded a new Volkswagen car
  I want to be able to track my car and see its progress
  in the My cars section along with any alerts


   Scenario Outline: VDT steps
    Given i am logged in with correct account
    And i am on the ordered car dashboard page with car which is on step <step_number>
    When i check the status of my order
    Then i should see the <status>
    And  i should see step <step> active


  Examples:
    | status                             |step                 |step_number|
    | Your order is being processed      | Order processing    |Step1      |
    | Your order is with the factory     | With the factory    |Step2      |
    | Your build week is confirmed       | Build week confirmed|Step3      |
    | Your Golf is being built           | Build in progress   |Step4      |
    | Your Golf is on its way            | In transit          |Step5      |
    | Your Golf has landed in the UK     | Arrived in the UK   |Step6      |
    | Your Golf is nearly ready          | Nearly there        |Step7a     |
    | Your model is with the retailer    | Nearly there        |Step7b     |

