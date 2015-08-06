@Disabled @vw-plugin-cps-vw-section-fleet
Feature: Company Car Tax Calculator
  As part of the site features for business users
  We need to make sure that we can correctly show the company car tax calculations
  So that business users realise the expected costs associated with purhcasing a VW Car

  Background: Viewing the Company Car Tax Calculator
    Given i am on the company car tax calculator page

  Scenario Outline: Viewing Monthly Tax Payable for different car models
    When i select the <model> as the model of car i want to view information for
    And i select a trim <trim> and engine style <engine>
    Then i should see a table appear showing various tax data values
    But if i change the tax band to 40% from 20%
    Then i should see the monthly tax values in the table update

    Examples:
    | model      | trim          | engine                                                    |
    | up!        | Take up!      | 1.0 60PS Manual 3 doors                                   |
    | up!        | High up!      | BlueMotion Technology 1.0 75PS Manual 5 doors             |
    | New Polo   | New Polo SE   | 1.0 75PS Manual 5 doors                                   |
    | New Polo   | New Polo SEL  | 1.4 TDI 90PS Manual 5 doors                               |
    | The Beetle | The Beetle    | BlueMotion Technology 1.6 TDI 105PS Manual 3 doors        |
    | The Beetle | Beetle Design | 1.2 TSI 105PS Dsg 3 doors                                 |

  Scenario: Visiting the Company Car Tax Calculator from the homepage
    Given i am back on the VW homepage as a new user
    When i click on the primary navigation link to the fleet section
    And i click on the button to view all valid calculators
    And i select the P11D And company car tax calculator option
    Then i should see the company car tax calculator page has appeared in my browser
