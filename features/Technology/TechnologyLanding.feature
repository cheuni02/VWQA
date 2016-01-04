@vw-plugin-cps-vw-section-technology @Daily
Feature: Technology Landing Page
  As part of the site features for users
  We need to provide details about the technology used
  So that users can find the best info for purchasing VW Cars

  Background: Viewing the Technology Landing Page
    Given i visit the technology landing page by clicking on the top level navigation link

  Scenario: Checking the Welcome video
    When i land on the technology page
    Then i should be able to see the video

  Scenario Outline: Checking the Technology navigation links and buttons on left side
    When i click on the link named <link> from technology landing page
    Then i see the webpage opened having the following title <title>

  Examples:
    | link                                | title                                             |
    | engines                             | Engines : Volkswagen UK                           |
    | transmissions-and-drivetrains       | Transmissions and drivetrains : Volkswagen UK     |
    | braking-and-stability-systems       | Braking and stability systems : Volkswagen UK     |
    | proximity-sensing                   | Proximity sensing : Volkswagen UK                 |
    | think-blue                          | Think Blue. : Volkswagen UK                       |
    | passive-safety                      | Passive safety : Volkswagen UK                    |
    | parking-and-manoeuvring             | Parking and manoeuvring : Volkswagen UK           |
    | driving                             | Driving : Volkswagen UK                           |
    | comfort-and-convenience             | Comfort and convenience : Volkswagen UK           |
    | electric-technology                 | Electric Technology : Volkswagen UK               |
    | navigation-and-entertainment-systems| Navigation and Entertainment systems : Volkswagen UK  |
    | other-technologies                  | Other technologies : Volkswagen UK                |
    | think-blue                          | Think Blue. : Volkswagen UK                       |
    | glossary                            | Technical Glossary : Volkswagen UK                |

  Scenario: Checking the thumbnails are displayed on Technology page
    When i see the additional technology sections on the page
    Then i should see right content for each additional section
