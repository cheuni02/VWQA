@ordered_car @Daily @login_Ordered_User @my_vw
Feature: Ordered car dashboard
  As a user who has just orderded a new Volkswagen car
  I want to be able to track my car and see its progress
  in the My cars section along with any alerts

   Scenario Outline: VDT steps
    Given i am logged in with correct account
    And i am on the ordered car dashboard page with car which is on step <step_number>
    When i check the status of my order
    Then i should see the <status> of my VDT Order in progress
    And  i should see step <step> active

    Examples:
      | step_number | status                          | step                 |
      | Step1       | Your order is being processed   | Order processing     |
      | Step2       | Your order is with the factory  | With the factory     |
      | Step3       | Your build week is confirmed    | Build week confirmed |
      | Step4       | Your Golf is being built        | Build in progress    |
      | Step5       | Your Golf is on its way         | In transit           |
      | Step6       | Your Golf has landed in the UK  | Arrived in the UK    |
      | Step7a      | Your Golf is nearly ready       | Nearly there         |
      | Step7b      | Your model is with the retailer | Nearly there         |
