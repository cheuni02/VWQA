@vw-plugin-cps-vw-section-new-cars
Feature: Order a brochure for a car model landing page
  As a prospective owner of a VW car model
  I want to be able to navigate and select VW car models
  So I can download or order brochures of the car models

  Background: Visit Order a brochure landing page
    Given i am visiting Order a brochure page on the site

  Scenario: Verify the elements on Order a brochure landing page
    When i see the page header and small description
    And i see the Older model brochures button
    Then i see the car models displayed as grid

  Scenario: Verify the brochure menu for each car model on Order a brochure landing page
    When i get the mouse over the car models i should see a popup with the name of the car, list of downloads and links to order a printed brochure and view the car

  Scenario: Verify you can order a printed brochure for a car model from Order a brochure landing page
    When i select a car model from car models grid
    And i click on Order printed brochures link from brochures menu
    Then i should be directed to Order a printed brochure starting page of the selected model

  Scenario: Verify you can view a car model details from Order a brochure landing page
    When i select a car model to view from car models grid
    And i click on View car button from brochures menu
    Then i should be directed to Car Overview page of the selected car model
