@MPV @Daily
Feature: My Perfect VW - Features
  As the owner of the VW website
  If I wish to have specific features included in my car
  I can see what options are available

  Background:
    Given that I have loaded the features section

  Scenario: Features - Overview
    When I load the features section
    Then there should be questions and the see cars button

  Scenario: Features
    When I have entered each of the questions
    Then the number of options should be "2"
