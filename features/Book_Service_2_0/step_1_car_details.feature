@Book_Service_2
Feature: Booking A Car Service Step 1
  As part of ensuring that our new service booking flow works as expected
  We need to ensure we can enter our car details on the first step of registration
  So that customers can enter all the required details for a new car service

  Background: Navigating to the new book a service pages
    Given i navigate to the book a service page
    And i expand the Information Panels

  Scenario: Get to Step 1 - Common Navigation
    Given i am on the Volkswagen Homepage
    When i click the book a service button in the navigation
    Then i should see step 1 of the new book a service flow loads in my browser

  Scenario: Get to Step 1 - My Car (Logged in)
    Given i login to my Volkswagen Account with a valid car saved
    When i visit the book a service section of the site
    Then i should see the details of my car are present on the page

  Scenario Outline: More Info card - Mileage Validation
    When i fill in the approximate <mileage> value in the more details form
    And i attempt to proceed to continue with my service booking
    Then i should get a <error> message if it is not valid

    Examples:
      | mileage | error      |
      | 20000   | should not |
      |         | should     |
      | dfffee  | should     |

  Scenario: More Info card - I am interested in service plan
    When i set my expanded details to state i am interested in a service plan
    And i proceed to the next step of service booking
    Then i should see the following simple text message in my summary
      """
      Service plan: I am interested in a service plan. Please call me to discuss options so I can start saving straight away.
      """

  Scenario: More Info Card - I Have Extended Warrenty
    When i set my expanded details to state that i have an extended warrenty
    And i continue to the next step of my service booking
    Then i should see the summary panel on the next step state that i have extended warrenty

  Scenario: More Info Card - Setting i have a Service plan
    When i set my expanded details as i already have a service plan
    Then i should no longer see the option to set that i want a service plan

  Scenario Outline: More Info card - I lease this car
    When i enable the I lease this car radio button in the more info box
    Then i should be able to type the lease <company> in the field
    And an error message <get> be displayed if it is not valid and i try to proceed

    Examples:
      | company    | get        |
      | rent a car | should not |
      |            | should     |
      | 24324£45   | should     |

  Scenario: More Info Card - Entered Leased Car Details
    Given my car has been leased to me by another company
    When i enter the name of the company into the leased car field
    And i proceed to the next page of service booking
    Then i should see my leased car details contained in my current booking summary

  Scenario: Edit car details - Account with multiple cars configured
    Given i log into an account with multiple cars saved
    When i return to the service booking page
    And i expand the car details panel
    Then i should see a dropdown allowing me to select which car i want to book for a service
    And if i change the dropdown the values in the car details panel should change

  Scenario Outline: Registration lookup - Valid
    Given i click on the "Registration Lookup" Button
    When i enter a vehicle registration <registration> into the registration field
    And i click on the lookup button to find my registration
    Then i should see my car details get filled in automatically with data

    Examples:
      | registration |
      | VU12WGE      |
      | FE06KHO      |
      | YM14YOX      |

  Scenario: Registration Lookup - Invalid
    Given i am attempting to look up my car registration
    When i enter an invalid registration number "1234567"
    And i click on the lookup button to find this registration
    Then i should not see any data in the car details fields

  Scenario Outline: Car Details Validation
    When i complete the Car information by entering my <model> and <trim>
    And i also enter my engine size of <engine_size> with manufacture year <year>
    And i set the transmission to <transmission> with fuel type <fuel>
    And i attempt to proceed with the next step of booking a service
    Then i <proceed> be able to continue with booking a service

    Examples:
      | model | trim          | engine_size | year | transmission | fuel   | proceed |
      | Golf  | SE Bluemotion | 2.0         | 1997 | Manual       | Petrol | Should  |
      | Up!   | Rock Up!      | 1.3         | 1970 | Automatic    | Diesel | Should  |
      |       | Rocky Up!     | 1.0         | 1008 | Automatic    | Diesel | Should Not |
      | Golf  |               | 1.2         | 1990 | Manual       | Petrol | Should Not |
      | Golf  | SE PinkMotion |             | 1990 | Manual       | Petrol | Should Not |
      | Golf  | SE PinkMotion | 1.2         |      | Manual       | Petrol | Should Not |
      | Golf  | SE PinkMotion | 1.2         | 1990 |              | Petrol | Should Not |
      | Golf  | SE PinkMotion | 1.2         | 1990 | Manual       |        | Should Not |
