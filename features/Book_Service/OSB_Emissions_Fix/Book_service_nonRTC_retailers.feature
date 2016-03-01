@OSB_Emissions_fix
Feature: OSB Emissions Fix - Book service for non RTC retailers (VWOSBEB-3)
  As a Car owner who has received an emissions fix notification
  I want to Book the emissions fix online (with a non-RTC retailer)
  So that I can have my car fixed

Background: pre-requisites
  Given the user is on the OSB first page
  And has selected a non RTC retailer: Alan Day Volkswagen (Hampstead)

Scenario:  my car is on the affected VINs list - the emissions fix work should be available in the list FOC
  Given my car is on the affected cars list and i have entered the reg number KV14EOT on the stage 'Your Vehicle'
  When I get to the “Select work” step on the OSB and select any service
  Then the emissions fix work should be available (only if engine size ia 1.2, 1.6 or 2.0), and opened by default
  And it should be pre-selected by default
  But I should be able to deselect it
  And I should be able to select any other additional work for my car


Scenario: I have selected the emissions fix work : the Convenience options should be FOC
  Given I have selected 'Emissions fix' at '3. Select work'
  When I get to the Convenience options at '4 Select date'
  Then all the convenience options should be free of charge



Scenario Outline: the 'Real time' (to be taken out of diary) depends on my engine size (for non RTC retailers)
  Given I am on the "Your Vehicle" page
  When I have provided my car reg number
  Then 3rd party experian should return car details engine incl. engine <size>
  When I match the engine size from experian with the ones configured on RCMS
  Then the work code shown in RCMS diary should be <job>
  And the engine fix time shown in RCMS diary should be <time>

  Examples:
    |size|job                |time|
    |1.2 |Emission Engine Fix|0.6 |
    |1.6 |Emission Engine Fix|0.85|
    |2.0 |Emission Engine Fix|0.6 |
