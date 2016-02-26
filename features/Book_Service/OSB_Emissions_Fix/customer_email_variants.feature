Feature: OSB Emissions Fix - Outbound email variants for Customers (VWOSBEB-4)
  As VW
  I want to send customised emails to car owners who have booked the emissions fix
  So that I can give a specific email message to customers who have booked specific work


Background: pre-requisites
  Given the user has selected a retailer from postcode : AAAA
  And has entered vehicle registration number: BBBB
  And the user's car is on the affected list and he has provided the VIN
  When I get to the “Select work” step on the OSB
  Then the emissions fix work should be available on top of work list

Scenario: car owner has only booked emissions fix services (new)
  Given he has selected emissions fix and not booked other additional service at "select work"
  And when he selects a date and time at "select date"
  And provides his personal details with his email address at "Your details"
  Then a standard email will be sent to user with services booked

Scenario: car owner has booked emissions fix service and additional services (new)
  Given he has selected emissions fix and another additional service at "select work"
  And when he selects a date and time at "select date"
  And provides his personal details with his email address at "Your details"
  Then a standard email will be sent to user with services booked

Scenario: car owner has booked some services, but not the emissions fix (existing)
  Given a car owner has selected some services at "select work"
  But he has not booked the emissions fix
  And when he selects a date and time at "select date"
  And provides his personal details with his email address at "Your details"
  Then a standard email will be sent to user with services booked