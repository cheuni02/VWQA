@Daily @vw-plugin-cps-vw-section-new-cars @vw-configurator @test-bau
Feature: New Car Configurator Page
  As the owner of the VW Website
  We want to make sure that customers can select varients of a new car they want to buy
  And that all the specifications are shown for the varients when on the page

  Scenario: Selecting a Car Model i like
    Given i have returned to the VW Homepage
    When i select the link to view the newest car models from Volkswagen
    And i select the "New Polo" As the model of car i am interested in
    And i select the navigation link to Configure a new car of this model
    Then i should see a list of car variations based on my section

  Scenario: Viewing More information
    Given i have preselected a new car model and opted to configure it
    When i select the "What's Included?" Link below a variation i am interested in
    Then i should see a panel open containing details about included features
    And if i then click the link to view the full specification
    Then i should see a panel open containing more specification details

  Scenario: Confirming the model i want
    When i select to build a 3 door configuration of the car i want
    Then i should be taken to the car configurator to specify more in depth options
