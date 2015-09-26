@ordered_car @Daily
Feature: Ordered car dashboard
  As a user who has just orderded a new Volkswagen car
  I want to be able to track my car and see its progress
  in the My cars section along with any alerts

  Scenario Outline: VDT steps
    Given i have logged in with a <username> and <password>
    And am on the ordered car dashboard page
    When i check the status of my order
    Then i should see the <status>

  Examples:
    | username    | password | status                          |
    | orderedcar@test.com| password123 | Your order is being processed   |
#    | bob@bob.com | password | your order with the factory     |
#    | bob@bob.com | password | your build week is confirmed    |
#    | bob@bob.com | password | your car is being built         |
#    | bob@bob.com | password | your car is on its way          |
#    | bob@bob.com | password | your car has landed in the UK   |
#    | bob@bob.com | password | your model is nearly there      |
#    | bob@bob.com | password | your model is with the retailer |

#  Scenario: Step 1 Order processing
#    Given i have logged into an account with a user who has an ordered car which is on step 1
#    When i am on the ordered car dashboard i should see Step 1
#    Then i should see the text "your order is being processed" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 2 With the Factory
#    Given i have logged into an account with a user who has an ordered car which is on step 2
#    When i am on the ordered car dashboard i should see Step 2
#    Then i should see the text "your order with the factory" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 3 Build Scheduled
#    Given i have logged into an account with a user who has an ordered car which is on step 3
#    When i am on the ordered car dashboard i should see Step 3
#    Then i should see the text "your build week is confirmed" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 4 Build in progress
#    Given i have logged into an account with a user who has an ordered car which is on step 4
#    When i am on the ordered car dashboard i should see Step 4
#    Then i should see the text "your car is being built" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 5 In transit
#    Given i have logged into an account with a user who has an ordered car which is on step 5
#    When i am on the ordered car dashboard i should see Step 5
#    Then i should see the text "your car is on its way" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 6 Arrived in the UK
#    Given i have logged into an account with a user who has an ordered car which is on step 6
#    When i am on the ordered car dashboard i should see Step 6
#    Then i should see the text "your car has landed in the UK" with my car model details
#    And a step description with a link to setup alerts if not setup already
#
#  Scenario: Step 7a Nearly there
#    Given i have logged into an account with a user who has an ordered car which is on step 7a
#    When i am on the ordered car dashboard i should see Step 7a
#    Then i should see the text "your model is nearly there"
#    And details of the step below
#
#  Scenario: Step 7b Arrived at retailer
#    Given i have logged into an account with a user who has an ordered car which is on step 7b
#    When i am on the ordered car dashboard i should see Step 7b
#    Then i should see the text "your model is with the retailer"
#    And a description of the status
