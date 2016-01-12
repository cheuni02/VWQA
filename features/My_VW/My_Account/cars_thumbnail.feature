@login_current_car @Cars_Thumbnail
Feature: Cars thumbnails in My account
  As a Volkswagen vehicle owner
  I want to be able to see correct cars thumbnails
  So that i see insight of all added cars

  Background:
    Given i have logged into my VW account with different types of cars added
    And i am on the My account page

  Scenario Outline: Verify the thumbnail
    When i check particular car <type> i want to see correct <thumbnail> present


    Examples:
      | type             | thumbnail |
      | FOX              | fox       |
      | BEETLE           | beetle    |
      | BEETLE CABRIOLET | beetle-cab|
      | PASSAT R-LINE    | passat    |
      | PASSAT ESTATE    | passat-estate|
      | VOLKSWAGEN CC    | cc        |
      | PASSAT ALLTRACK  | passat    |
      | SCIROCCO         | scirocco  |
      | TIGUAN           | tiguan    |
      | E-UP!            | default   |
      | EOS              | eos       |
      | TOURAN           | touran    |
      | SHARAN           | sharan    |
      | TOUAREG          | touareg   |
      | E-GOLF           | default    |
      | PHAETON          | phaeton   |
      | UP!              | up        |
      | POLO             | polo      |
      | GOLF             | golf      |
      | GOLF GTD         | default   |
      | GOLF CABRIOLET   | golf-cab  |
      | GOLF PLUS        | golf-plus |
      | GOLF ESTATE      | golf-estate|
      | GOLF SV          | golf-sv   |
      | JETTA            | jetta     |
