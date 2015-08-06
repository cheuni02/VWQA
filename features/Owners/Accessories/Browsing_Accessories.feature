@Daily @vw-accessories
Feature: Browsing Accessories
  As a customer that already owns a Volkswagen car
  I want to be able to browse through the list of accessories availible for my car
  And i need to be able to find and view details about each of these accessories i might want.

  Scenario: Finding the list of accessories
    Given i have visited the Volkswagen homepage on the website
    When i go to the Owners section of the site as detailed on the top level navigation
    And i select the option that allows me to browse all availible accessories
    Then i should see a page containing options for accessories or mechandise
    And if i then choose the option to view all accessories
    Then i should see a page that contains a range of accessories and options to filter what i am looking for

  Scenario Outline: Keyword Search
    Given i want to search for a specific accessory
    When i enter a keyword of <search> into the search by keyword box on the webpage
    Then i should see a series of results that are relevant to my search terms

    Examples:
    | search    |
    | First Aid |
    | Bob       |
    | Kit       |
    | Wheel     |
    | Wash      |

  Scenario Outline: Filtering by car model
    Given i clear all of the filters i previously applied to the page
    When i select a select my valid car model of <model>
    And i select <year> Which represents the year the car i want to find accessories for
    Then i should see that results are present in my browser

    Examples:
    | model        | year        |
    | Polo         | 2009 - 2014 |
    | Golf         | 1984 - 1992 |
    | Golf Plus    | 2006 - 2008 |
    | Golf Estate  | 2005 - 2010 |
    | Golf Cabrio  | 1979 - 1993 |
    | Beetle       | 1999 - 2005 |
    | Jetta        | 1984 - 1992 |
    | Passat       | 2006 - 2010 |
    | Scirocco     | 2008 - 2014 |
    | Tiguan       | 2008 - 2010 |
    | Eos          | 2006 - 2010 |
    | Touran       | 2003 - 2006 |
    | Sharan       | 1996 - 2000 |
    | Touareg      | 2003 - 2006 |
    | Phaeton      | 2002 - 2010 |
    | up!          | All         |
    | Volkswagen CC| All         |

  Scenario Outline: Filtering By Category
    Given i ensure i have no active filters on the accessories search page
    When i select a category named <category> from the dropdown panel on the page
    Then i should see accessory search results are present in my browser

    Examples:
    | category                 |
    | Sport & Styling          |
    | Alloys                   |
    | Technology               |
    | Touring                  |
    | Child Seats              |
    | Convenience & Protection |
    | Car Care                 |

  Scenario: Looking for retailers
    When i enter my location as "Uxbridge" in the Search for retailers box on the accessories page
    Then i should see a panel appear containing a list of retailers that are near my location

  Scenario: Viewing Product details
    Given i reset any previous filters i have applied to the page
    When i select the first product from the entire list of accessories on the page
    Then i should see some more information about the product including its price and description
