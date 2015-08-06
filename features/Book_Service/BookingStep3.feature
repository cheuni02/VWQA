@Daily @vw-plugin-cps-vw-section-owners
Feature: Booking a Service Step 3
  As our customers continue to proceed with booking their car service
  We need to make sure that we can select the type of service we require
  And that the cost of this maintenance is displayed correctly on the page

  Background: Setting up our car details
    Given i have selected a location for a service and have entered my car details

  Scenario: Not Selecting a Service Item
    When i do not select a service item and try to continue to the next page
    Then i should see an error on the page requesting to select an item

  Scenario: Selecting a Major service item
    When i select the 3rd radio button on the page so that i can get my car to have an MOT
    Then i should see the price information on the page update to the correct value

  Scenario: Selecting Scheduled Maintenance options
    When i select to have an air conditioning refresh done on my car
    And i opt in to having the brake fluid changed on my car
    Then i should see the price update to "£88.00" with the new information

  Scenario: Selecting Unscheduled Maintenance
    #When i select to have my my cars front and rear brake pads maintained
    When i select to have a battery replacement performed on my car
    #Then i should see the price displayed on the page update to "From £347.00"
    Then i should see the total price message
    And i should also see a message that the price is dependant on a quotation

  Scenario: Entering additional information and continuing to next step
    When i enter some additional information about my repair to the service selection form
    And i select some service options from the list on the page
    And i proceed to the next stage of the service booking form
    Then i should see the form to select the date of my service present in my browser
