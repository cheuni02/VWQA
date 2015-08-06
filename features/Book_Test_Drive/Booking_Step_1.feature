@Daily @vw-web-site
Feature: Booking a Test Drive - Step 1
  As we offer possible test drives for a vehicles
  We need to ensure that customers can book in for a test drive
  And that they have the option to select which car they want to test drive

  Scenario: Selecting the book test drive link
    Given i am visiting the Volkswagen homepage
    When i click the top level link to book a test drive
    Then i should see a page load that allows me to select the car i want to book

  Scenario Outline: Selecting My Car Model
    Given i cancel any previous choices and start booking a test drive again
    When i select the car model named <modelName>
    Then i should see the postcode selector appear in my browser

    Examples:
    | modelName                |
    | New Passat               |
    | up!                      |
    | New Polo                 |
    | The Beetle               |
    | Golf                     |
    | Golf Estate              |
    | The Beetle Cabriolet     |
    | Touran                   |
    | Tiguan                   |
    | Golf Cabriolet           |
    | New Passat Estate        |
    | Volkswagen CC            |
    | Sharan                   |
    | Performance Golfs        |
