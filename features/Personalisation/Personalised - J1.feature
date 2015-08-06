@Personalisation @Daily
Feature: Personalised My Volkswagen Experience - Journey 1
  In order to ensure that our customers are receiving a personalised Volkswagen experience
  We need to check that once a user follows the rules regarding the first Journey
  That the website updates its content links to the correct set according to the required rules

  Background: Ensuring i am on the personalised User Flow
    Given i visit the Volkswagen Homepage
    And i ensure that i have been selected to use the randomised personalisation flow

  Scenario: Visiting the Volkswagen Homepage for the first time
    When i observe the homepage loaded in my browser window
    Then i should see the standard set of links present on the left side of the main page

  Scenario Outline: Checking MLP Personalisation Flows
    When i visit the car range selection page
    And i select to view details about the <model> Model
    And i return back to the homepage
    Then i should see homepage links to "I want to find a retailer" and "I need some help & support"

    Examples:
    | model                |
    | up!                  |
    | New Polo             |
    | The Beetle           |
    | Golf                 |
    | The Beetle Cabriolet |
    | The New Golf Estate  |
    | New Jetta            |
    | Golf SV              |
    | e-up!                |
    | Touran               |
    | Passat               |
    | New Scirocco         |
    | Tiguan               |
    | Passat Estate        |
    | Golf Cabriolet       |
    | Volkswagen CC        |
    | Sharan               |
    | Performance Golfs    |
    | e-Golf               |
    | New Touareg          |

  Scenario Outline: Switching Between Multiple Models
    When i visit the car range page listing all the Volkswagen models
    And i select my <first_model> from the list of models before returning to the homepage
    Then i should see the <first_image> image appear in my homepage carousel
    But if i go back and change my select to be of <second_model>
    Then i should now see my homepage carousel update to contain <second_image>

    Examples:
    | first_model   | first_image       | second_model | second_image      |
    | New Polo      | hp-polose-pers    | Tiguan       | hp-dog-pers       |
    | Sharan        | hp-dog-pers       | New Polo     | hp-polose-pers    |
    | Passat        | hp-passats-pers   | The Beetle   | hp-dog-pers       |
    | Volkswagen CC | hp-dog-pers       | Passat       | hp-passats-pers   |
    | Golf          | hp-golfmatch-pers | Touran       | hp-dog-pers       |
    | Golf SV       | hp-dog-pers       | Golf         | hp-golfmatch-pers |

  @Disabled
  Scenario Outline: Checking Personalised Carousel images
    Given i visit the <model> MLP page using the site navigation
    When i return to the homepage of the Volkswagen website
    Then i should see the carousel displays an image named <image>

    Examples:
    | model    | image                       |
    | New Polo | polo-carousel               |
    | Passat   | golf-cabriolet-carousel     |

  @Disabled
  Scenario: Checking Personalised Test Drive Link point to the correct page
    Given i visit the car range page and select to view details about the "New Polo"
    When i navigate back to the VW homepage
    And i click on my personalised link to "Book a Test Drive"
    Then i should be taken to the book a test drive page for the "Polo" Model

  @Disabled
  Scenario: Checking Personalised Configure Link point to the correct page
    Given i navigate to the MLP page for the "Up!" Model on the VW Website
    When i return to the site homepage once again
    And i click on my second personalised quick link to "Configure a Volkswagen"
    Then i should see the configure page in my browser load for the model i selected
