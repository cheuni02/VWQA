@login_Current_User @Cars_Thumbnail
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
      | type              | thumbnail |
      | FOX               | http://www.volkswagen.co.uk/assets/content/mobile/low/fox.jpg       |
      | BEETLE            | http://www.volkswagen.co.uk/assets/content/mobile/low/beetle.jpg    |
      | BEETLE CABRIOLET  | http://www.volkswagen.co.uk/assets/content/mobile/low/beetlecab.jpg |
      | PASSAT R-LINE    | http://www.volkswagen.co.uk/assets/content/mobile/low/passat.jpg    |
      | PASSAT ESTATE    | http://www.volkswagen.co.uk/assets/content/mobile/low/passat.jpg    |
      | VOLKSWAGEN CC    | http://www.volkswagen.co.uk/assets/content/mobile/low/volkswagencc.jpg |
      | PASSAT R-LINE    | http://www.volkswagen.co.uk/assets/content/mobile/low/passat.jpg    |
      | PASSAT ALLTRACK  | http://www.volkswagen.co.uk/assets/content/mobile/low/passat.jpg    |
      | SCIROCCO         | http://www.volkswagen.co.uk/assets/content/mobile/low/scirocco.jpg  |
      | TIGUAN           | http://www.volkswagen.co.uk/assets/content/mobile/low/tiguan.jpg    |
      | E-UP!            | http://www.volkswagen.co.uk/assets/content/mobile/low/eup.jpg       |
      | EOS              | http://www.volkswagen.co.uk/assets/content/mobile/low/eos.jpg       |
      | TOURAN           | http://www.volkswagen.co.uk/assets/content/mobile/low/touran.jpg    |
      | SHARAN           | http://www.volkswagen.co.uk/assets/content/mobile/low/sharan.jpg    |
      | TOUAREG          | http://www.volkswagen.co.uk/assets/content/mobile/low/touareg.jpg   |
      | E-GOLF           | http://www.volkswagen.co.uk/assets/content/mobile/low/e_golf.jpg    |
      | PHAETON          | http://www.volkswagen.co.uk/assets/content/mobile/low/phaeton.jpg   |
      | UP!              | http://www.volkswagen.co.uk/assets/content/mobile/low/up.jpg        |
      | POLO             | http://www.volkswagen.co.uk/assets/content/mobile/low/polo.jpg      |
      | GOLF             | http://www.volkswagen.co.uk/assets/content/mobile/low/golf.jpg      |
      | GOLF GTD         | http://www.volkswagen.co.uk/assets/content/mobile/low/golfgtd.jpg   |
      | GOLF CABRIOLET   | http://www.volkswagen.co.uk/assets/content/mobile/low/default.jpg   |
      | GOLF PLUS        | http://www.volkswagen.co.uk/assets/content/mobile/low/golfplus.jpg  |
      | GOLF ESTATE      | http://www.volkswagen.co.uk/assets/content/mobile/low/golfestate.jpg|