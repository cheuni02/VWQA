@Cars_Thumbnail @my_vw
Feature: Cars thumbnails in My account
  As a Volkswagen vehicle owner
  I want to be able to see correct cars thumbnails
  So that i see insight of all added cars

#  @login_current_car
#  Scenario Outline: Verify the thumbnail part1
#    Given i have logged into my VW account with 25 different types of cars added
#    And i am on the My account page with 25 cars in car settings
#    When i check particular car <type> i want to see correct <thumbnail> present
#
#
#    Examples:
#      | type             | thumbnail |
#      | FOX              | fox       |
#      | BEETLE           | beetle    |
##      | BEETLE CABRIOLET | beetle-cab|
#      | PASSAT           | passat    |
#      | PASSAT ESTATE    | passat-estate|
#      | VOLKSWAGEN CC    | cc        |
#      | PASSAT ALLTRACK  | default   |
#      | SCIROCCO         | scirocco  |
#      | TIGUAN           | tiguan    |
#      | E-UP!            | default   |
#      | EOS              | eos       |
#      | TOURAN           | touran    |
#      | SHARAN           | sharan    |
#      | TOUAREG          | touareg   |
#      | E-GOLF           | default   |
#      | PHAETON          | phaeton   |
#      | UP!              | up        |
#      | POLO             | polo      |
#      | GOLF             | golf      |
#      | GOLF GTD         | default   |
##      | GOLF CABRIOLET   | golf-cab  |
#      | GOLF PLUS        | golf-plus |
#      | GOLF ESTATE      | golf-estate|
#      | GOLF SV          | golf-sv   |
#      | JETTA            | jetta     |

  @login_Current_User_Ext
  Scenario Outline: Verify the thumbnail part2
    Given i have logged into my VW account with 8 different types of cars added
    And i am on the My account page with 8 cars added
    When i check car <type> i want to see correct <thumbnail> present

  Examples:
    | type             | thumbnail|
    | BORA             | bora     |
    | LUPO             | lupo     |
    | PASSAT CC        | passat-cc|
    | CORRADO          | default  |
    | VENTO            | default  |
    | DERBY            | default  |
    | SANTANA          | default  |
    | XL1              | xl1      |