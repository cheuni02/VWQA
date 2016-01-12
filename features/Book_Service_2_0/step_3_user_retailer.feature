@my_vw @Service-Booking-2
Feature: Service booking Step 3 Retailer
  As a Volkswagen car owner i want to be able to book a service
  I should be able to complete Step 1 and Step 2 in book a service and be taken to Step 3
  where I will need to find my local retailer

  @login_complete_details_user @clear_cookies
  Scenario: as a logged in user I have completed Step 1, 2 and my post code is pre populated from my address details
    Given as a logged in user without a registered car I have completed steps 1 and 2
    But my postcode is pre-populated in search
    When I click lookup
    And I select the map tab
    Then I'm presented with a map view of local VW dealers
    And the map has a pin where my nearest retailer is located

  @login_Current_User @clear_cookies
  Scenario: as a logged in user I have completed Step 1, 2 and my post code is pre populated
    Given as a logged in user with a registered car I have completed steps 1 and 2
    Then my previously saved retailer is presented
    When I select edit my retailer
    Then my previously saved retailer is still selected


