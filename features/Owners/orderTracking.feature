@Daily @vw-plugin-cps-vw-section-owners
Feature: Checking order booking numbers
  As the owner of the VW Website
  I want to make sure that all of the customers who have purchased cars at dealers can view the current state of their order
  As we need to ensure that the customer can sign up for alerts based on their order status

  Background: Visiting the order tracker page
    Given i am on the order tracking page on the VW Website

  Scenario: Using website links to get to the order tracking page
    Given i am starting from the VW Homepage
    When i click on the top level navigation link to view the Owners landing page
    And i click on the button to try and track my order without entering a number
    Then i should be taken to the order tracking page on the website

  Scenario: Using an invalid order number
    When i search for a non existant order number of "03847373"
    Then i should see an error presented in my browser window

  Scenario: Searching for a valid order number
    When i submit my valid order number of "25127106" into the tracking field
    Then i should see a page appear containing information about the current progress of my order

  Scenario: Signing up for alerts while logged out
    When i submit a different valid order number for my VW Car of "25127106"
    And i click on the link to sign up for alerts about my VW Build order
    Then i should see the login page load in my browser window

  @login @Disabled
  Scenario: Signing up for email alerts with a valid account
    When i submit my VW Car order number of "25142091"
    And i click on the link to sign up for alerts on my order
    And i fill in the save my car details on the new car field
    Then i should see a button allowing me to setup email alerts
    And if i click the setup button
    And i set my email to "Gowtham.Selvarajah@tribalworldwide.co.uk" and accept the sign up form
    Then i should be taken back to the main profile page of my login
