@login_Ordered_User @my_vw @Ordered-Car-Dashboard
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
      | step_number        | status                          | step                      |
      | OrderedStep1       | Your order is being processed   | Processing your order     |
      | OrderedStep2       | Your order is with the factory  | With the factory          |
      | OrderedStep3       | Your build week is confirmed    | Build week confirmed      |
      | OrderedStep4       | Your Polo is being built        | Build in progress         |
      | OrderedStep5       | Your Polo is on its way         | In transit                |
      | OrderedStep6       | Your Polo has landed in the UK  | Arrived in the UK         |
      | OrderedStep7       | Your Polo is nearly ready       | Nearly there              |
