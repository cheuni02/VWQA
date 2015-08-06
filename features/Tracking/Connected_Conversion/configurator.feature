Feature: Connected Conversion Tracking - Configurator
  As the owner of the VW website
  I'd like to ensure that if a user navigates away from the configurator
  Then ads should appear related to their configuration

  Background:
    Given that I have loaded the VW website

  Scenario Outline: Checking JS scripts for correct values
    When I have navigated to the <models> configurator page for <trim> and <derivative>
    Then I should see conversion.js being referenced in a script tag
    And I should also see CDATA
    And I should also see a tracking pixel for nonJS users
    And I should see an iframe generated via the tag
    And it should contain the correct information
    But when I click on the overview button
    Then the finished attribute, known as U11, should read "true"

    Examples:
    | models             | trim   | derivative |
    | sharan-nf          | 849    | 852        |
    | up-nf              | 1566   | 1573       |
    | polo-gp            | 1841   | 1842       |
    | beetle-nf          | 1215   | 1356       |
    | beetle-cab         | 1393   | 1394       |
    | golf-vii           | 1354   | 1368       |
    | jetta-gp           | 2000   | 2001       |
    | golf-estate-vii    | 1585   | 1591       |
    | golf-sv            | 1799   | 1805       |
    | touran-gp-ii       | 881    | 882        |
    | scirocco-gp        | 1855   | 1858       |
    | passat-viii        | 1998   | 2049       |
    | golf-cabriolet-nf  | 1207   | 1210       |
    | tiguan-gp          | 1141   | 1178       |
    | passat-estate-viii | 2044   | 2073       |
    | e-up-nf            | 1651   | 1652       |
    | volkswagen-cc-fl   | 1263   | 2182       |
    | golf-gti-vii       | 1523   | 1527       |
    | e-golf-vii         | 1770   | 1771       |
    | touareg-fl         | 2020   | 2021       |

   Scenario: Changes to configuration
     When I have navigated to "golf-vii" config page for "1986" and "1993"
     Then the iframe should contain the correct information
     And when I change the engine, paint, wheels, interior and extras
     Then the iframe contents should change accordingly
