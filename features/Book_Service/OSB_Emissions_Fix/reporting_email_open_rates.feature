Feature: OSB Emissions Fix - Reporting - email open rates (VWOSBEB-6)
  As a VW aftersales manager
  I want to receive daily (x2) reports on email open rates
  So that I can ensure that retailers are following up with customers who have booked the emissions fix

Scenario: Pre-req: Logging on as customer 1 with an affected car to book service with emissions fix
  Given I am on the login page
  When I sign in as Customer 1 who is illegible for an emissions fix
  And I select retailer AAAA at "Choose retailer"
  And provide vehicle reg and VIN at "Your vehicle"
  And select Emissions fix at "Select work"
  And select date and time at "Select date"
  And provide Customer 1's details at "Your details"
  And Confirms Booking at "Review & Confirm"
  Then Customer 1 should get a booking email

Scenario: Pre-req: Logging on as customer 2 with an affected car to book service with emissions fix
  Given I am on the login page
  When I sign in as Customer 2 who is illegible for an emissions fix
  And completes service booking for the same retailer AAAA (non RTC) with his VIN number
  Then Customer 2 should get a booking email

Scenario: Pre-req: Logging on as customer 3 with an affected car to book service with emissions fix
  Given I am on the login page
  When I sign in as Customer 3 who is illegible for an emissions fix
  And completes service booking for the same retailer AAAA with his VIN number
  Then Customer 2 should get a booking email


Scenario: Pre-req: Logging on to RCMS as the retailer to view the customers' requests
  Given I am on the RCMS log in page
  When I log in as the credentials of the retailer AAAA
  Then I should see the bookings by Customer 1, 2 and 3


Scenario: Logging on to RCMS as the retailer to acknowledge SOME of the customer's requests
  Given I am on the RCMS log in page
  When I log in as the credentials of the retailer AAAA
  And I open the booking emails for Customers 1 and 2 only (exclude 3)

Scenario: Pre-req: mapping the aftersales manager to the retailer
  Given I am on the VW aftersales login page
  When I log in as one
  Then I should be able to select a retailer from a list


Scenario: Logging on as VW aftersales manager to make sure that the customers requests are dealt with for retailer who has read customer booking
  Given Retailer AAAA has acknowledged the bookings for Customers 1 and 2 only
  And I am on the VW aftersales reporting system logged on as VW aftersales manager for retailer AAAA
  Then a report should be sent to retailer AAAA and see that the 2 customers have been acknowledged
  And this should detail in showing that Customers 1 and 2 are of status 'followed up' and cutomer 3 is 'email open'

Scenario: Logging on to RCMS as the retailer to make sure ALL of the customer's requests are acknowledged
  Given it has been less than an hour since the report was sent to the Aftercare sales member
  And I am on the RCMS log in page
  When I log in as the credentials of the retailer AAAA
  And I open the booking emails for Customers 3 only (making sure ALL of the customer's requests are acknowledged)

Scenario: Logging on as VW aftersales manager to make sure that the customers requests are dealt with for retailer who has read customer booking (second report)
  Given Retailer has now acknowedged Customer 3
  And I log in to the VW aftersales reporting system as VW aftersales manager for retailer AAAA
  When I wait 1 hr after the first report sent to Aftersales manager
  Then I should recieve the second more updated report of the retailer
  And I should recieve the same report thereafter with 1 hr intervals

# just checking rates
# last 4 scenarios need to take out
