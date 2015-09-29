@ordered_car @Daily
Feature: Ordered car dashboard
  As a user who has just orderded a new Volkswagen car
  I want to be able to track my car and see its progress
  in the My cars section along with any alerts

  Background:
    Given that i am logged in with correct account

  Scenario: Step 1 Order processing
    When i have logged into an account with a user who has an ordered car which is on step 1
    Then i am on the ordered car dashboard i should see Step 1
    And i should see the text "Your order is being processed" with my car model details
    And a step description with a link to setup alerts in Step 1 if not setup already

  Scenario: Step 2 With the Factory
    When i have logged into an account with a user who has an ordered car which is on step 2
    Then i am on the ordered car dashboard i should see Step 2
    And i should see the text "Your order is with the factory" with my car model details
    And a step description with a link to setup alerts in Step 2 if not setup already

#  Scenario: Step 3 Build Scheduled
#    Given i have logged into an account with a user who has an ordered car which is on Step 3
#    When i am on the ordered car dashboard i should see Step 3
#    Then i should see the text "Your build week is confirmed" with my car model details
#    And a step description with a link to setup alerts Step 3 if not setup already

  Scenario: Step 4 Build in progress
    Given i have logged into an account with a user who has an ordered car which is on step 4
    When i am on the ordered car dashboard i should see Step 4
    Then i should see the text "Your Golf is being built" with my car model details
    And a step description with a link to setup alerts in Step 4 if not setup already

  Scenario: Step 5 In transit
    Given i have logged into an account with a user who has an ordered car which is on step 5
    When i am on the ordered car dashboard i should see Step 5
    Then i should see the text "Your Golf is on its way" with my car model details
    And a step description with a link to setup alerts in Step 5 if not setup already

  Scenario: Step 6 Arrived in the UK
    Given i have logged into an account with a user who has an ordered car which is on step 6
    When i am on the ordered car dashboard i should see Step 6
    Then i should see the text "Your Golf has landed in the UK" with my car model details
    And a step description with a link to setup alerts in Step 6 if not setup already

  Scenario: Step 7a Nearly there
    Given i have logged into an account with a user who has an ordered car which is on step 7a
    When i am on the ordered car dashboard i should see Step 7a
    Then i should see the text "Your Golf is nearly ready" with my car model details
    And details of the step below

#  Scenario: Step 7b Arrived at retailer
#    Given i have logged into an account with a user who has an ordered car which is on step 7b
#    When i am on the ordered car dashboard i should see Step 7b
#    Then i should see the text "Your Golf is with the retailer" with my car model details
#    And a description of the status
