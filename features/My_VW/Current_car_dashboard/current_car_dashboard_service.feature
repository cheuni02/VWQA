Feature: Current Car Dashboard with Servicing enabled
  As a new my VW User on the Volkswagen platform
  I expect to be able to see the service history and details of my car
  Provided that i have given the correct owner details for my car.

  Scenario: My Service history
    When i am on the service history module
    Then i should see my vehicles service history

  Scenario: My Plans
    When i am on the my plans section
    Then i should see any plans that i have
