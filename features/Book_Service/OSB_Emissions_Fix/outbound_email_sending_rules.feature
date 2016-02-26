Feature: OSB Emissions Fix - Outbound email sending rules for Retailer recipients (VWOSBEB-5)
  As VW
  I want to Ensure that retailers follow up on clients who have booked the emissions fix
  So that I can be confident that the process is working smoothly

Background: pre-requisites
  Given the service manager configured in RCMS
  And the user is on the OSB first page

Scenario: a customer books the emissions fix - service booking email is sent to service manager
  Given user selects 'retailer 1' from "1. Choose retailer" (any NON RTC retailer)
  When a car registration is provided at stage "2. Your vehicle"
  And any service selected at "3. Select work"
  And when he selects a date and time at stage "4. Select date"
  And selects the 'emissions fix' at stage "select date"
  And provides his personal details with his email address at "5. Your details"
  And submits booking at stage "6. Review & Confirm"
  Then the service manager of <retailer 1> should receive a notification email

#email is sent currently, will need to clarify if the email for the case when an emissions fix is booked should look different
Scenario: the service manager has received the notification email but has not opened it within X hours
  Given the notification email (concerning an emission fix booking) has been sent to the service manager
  When X hours pass from sending the email service manager notification email
  But the email has not been open
  Then a follow up email should be sent to the same contact

Scenario: the two emails sent to the service manager have not been opened within X hours
  Given the follow up email has been sent to the service manager of <retailer 1>
  When X hours pass from sending the follow up email
  But the the inital email has not been open
  And the the follow email has not been open
  Then a second follow up email should be sent to the brand manager (i.e. Joe) of <retailer 1>


  #service manager configurable via RCMS
  #brand manager cannot - wait for Joe