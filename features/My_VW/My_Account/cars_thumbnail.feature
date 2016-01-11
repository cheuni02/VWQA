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
      | FOX              | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/fox.jpg       |
      | BEETLE           | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/beetle.jpg    |
      | BEETLE CABRIOLET | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/beetle-cab.jpg|
      | PASSAT R-LINE    | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/passat.jpg    |
      | PASSAT ESTATE    | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/passat-estate.jpg|
      | VOLKSWAGEN CC    | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/cc.jpg        |
      | PASSAT R-LINE    | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/passat.jpg    |
      | PASSAT ALLTRACK  | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/passat.jpg    |
      | SCIROCCO         | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/scirocco.jpg  |
      | TIGUAN           | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/tiguan.jpg    |
      | E-UP!            | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/default.jpg   |
      | EOS              | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/eos.jpg       |
      | TOURAN           | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/touran.jpg    |
      | SHARAN           | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/sharan.jpg    |
      | TOUAREG          | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/touareg.jpg   |
      | E-GOLF           | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/e_golf.jpg    |
      | PHAETON          | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/phaeton.jpg   |
      | UP!              | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/up.jpg        |
      | POLO             | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/polo.jpg      |
      | GOLF             | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golf.jpg      |
      | GOLF GTD         | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golfgtd.jpg   |
      | GOLF CABRIOLET   | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golf-cab.jpg  |
      | GOLF PLUS        | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golf-plus.jpg |
      | GOLF ESTATE      | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golf-estate.jpg|
      | GOLF SV          | http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/golf-sv.jpg   |
