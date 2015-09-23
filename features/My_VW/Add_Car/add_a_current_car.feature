Feature: Add a current car
  As a Volkswagen vehicle owner
  I want to be able to add my current car to my account
  So that i track and interact with my vehicle

    Background:
      Given i have logged into my VW account and am on the My VW page
      And i go to the add a car page and click on the "A car i own" button

    Scenario Outline: Add a car options - Step 1a
      When i check i am on the Add a car i own page
      Then i should see three <options> to add a car

      Examples:
        | options          |
        | A car i own      |
        | A car i ordered  |
        | A configured car |

    Scenario Outline: Add A car i own - Step 1b validation
      When i enter a <registration> in the input field
      Then i should see a error message if the registration needs to be reviewed

      Examples:
        | registration |
        | GD14HSX      |
        |              |
        | gf3435"3$%   |

    Scenario Outline: Add a car i own - Step 1b
      When i enter my <registration>
      And click the lookup button
      Then i should see a message saying think we've found your car

      Examples:
         | registration |
         |              |
         |              |
         |              |

    Scenario: Add a car i own - Step 1c
      When i have completed steps 1a and 1b
      And have selected the used car button and given it a name
      Then after i click continue i should be taken to a page asking me to select a retailer

    Scenario Outline: Add a car i own - Step 1c edit mode
      When i have completed steps 1a, b and click on the edit link in the My cars box
      And i fill in the required details such as <day>, <month>, <year>, <engine_size>
      Then i should see a error message to let me know if i need to review any details

      Examples:
        | day | month     | year | engine_size |
        | 02  | september | 2015 |             |
        |     | october   | 2015 | 1.4         |
        | 02  | october   | 2015 | 1.4         |

    Scenario Outline: Add an owned car - Step 2a search by postcode
      When i finished completing steps 1a, b, c
      And search for a retailer using a <postcode> and click the lookup button
      Then i should see a list of retailers in a list
      And a map view of the retailer as well

      Examples:
        | postcode |
        | NW9 9JR  |
        | W2 6AA   |
        |          |
        | df$dsg£3 |

      Scenario Outline: Add an owned car - Step 2a search by retailer name
        When i have completed Step 1a, b, c
        And search for a retailer using a <retailer_name>
        Then i should be able to select that retailer

        Examples:
          | retailer_name    |
          | Blackpool        |
          | Hampstead        |
          | Citygate Watford |

      Scenario: Add an owned car - Step 2a
        When i have finished all the steps until selecting a retailer
        And i select my retailer and click the continue button
        Then i should be able to see Step 3 Registered owner details

      Scenario: Add an owned car - Step 3 Skip & finish
        When i have completed Steps 1 and 2
        And i click the Skip & finish button
        Then i should see the car in the owned cars section

      Scenario: Add an owned car - Step 3 Validation
        When i have completed Steps 1 and 2 for adding a car i own
        And i enter my <last_name> and <postcode>
        Then i should get an error message if it can not find a record

        Examples:
          | last_name | postcode |
          | patrick   | SE168tW  |
          |           | W2 6AA   |
          | patrick   |          |

      Scenario: Add an owned car - Step 3
        When i have complete Steps 1 and 2 for adding my car
        And i enter my last name and postcode
        Then after i click finish i should see my car in the owned cars section
