@login_current_car @my_vw @Current-Car-Dashboard
Feature: Current car dashboard
  As a user logged in the My VW site
  I want to see a page with important information about my current car

    Background:
      Given that i have logged in to my account

    Scenario: Current car dashboard
      When the current car dashboard page has loaded
      Then I should be greeted with my current car dashboard and my name

    Scenario: My car hero module
      When i check the content of the hero module
      Then i should see a hero tagline with my car name
      And i should also see a camera icon on the page

    Scenario: My Service Retailer Module
      When i check the content of the service retailer module
      Then i should see a map loaded displaying my retailer location
      And i should also see the following retailer address details displayed:
      | Ipswich Volkswagen | Sproughton Road | Ipswich | IP1 5AN |
      And i should see the following contact details:
      | Phone        | Fax          | Email                   |
      | 01473 240800 | 01473 240088 | tribalddbtech@gmail.com |

    Scenario: My Retailer Link
      When i click on the link to view my retailers website
      Then i should see the retailer page for "Ipswich Volkswagen" load in my browser

    @my-vw-test
    Scenario Outline: My Service gurantee module
      When i click on a <gurantee> link in the service guarantee module
      Then the <page> page should load successfully in my browser

      Examples:
        | gurantee                               | page                     |
        | /owners/service-promise                | service-promise          |
        | /owners/servicing/what-wecheck-and-why | what-we-check-and-why    |
        | /owners/volkswagengenuine-parts        | volkswagen-genuine-parts |

    Scenario: My Service History Notification
      When i check the service history and plans section of my account
      Then i should see a message prompting me to enter my postcode for more information

    Scenario Outline: Promo Module
      When i am on the promo modules section
      Then i should see the <promotions> promotion
      And the promotion headline

      Examples:
        | promotions            |
        | Fixed price servicing |
        | Extended warranty     |
        | Accessories           |

    Scenario Outline: Need help module
      When i am on need help module
      Then i should see the need help search bar
      And the following <useful_links> section appears

      Examples:
        | useful_links            |
        | Owner's manual          |
        | Warning lights          |
        | How tos                 |
        | Breakdown and insurance |

    Scenario Outline: Need help search
      When i search for <help> in the need help section
      Then i should get a <result> from my need help search

    Examples:
      | help      | result |
      | breakdown | pass   |
      | insurance | pass   |
      | b34f      | fail   |

    Scenario Outline: Preferred Retailer
      When i am on the Current dashboard
      Then i should see my preferred retailer
      And the <links> link in the box

      Examples:
        | links            |
        | View in maps     |
        | Retailer website |

    Scenario Outline: Recovery zone
      When i scroll to the bottom of the page
      Then the <buttons> button should appear for the user

      Examples:
        | buttons          |
        | Book a service   |
        | Keep me informed |
        | Contact Us       |
