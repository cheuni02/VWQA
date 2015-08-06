@Daily @vw-configurator @vw-plugin-cps-vw-section-my
Feature: Reviewing my configured new car
  As the owners of the VW Website configurator
  We need to ensure that customers can review their configured car
  And that they can save configurations and return to them either through a shortlink or their profile

  Background: Creating my Preconfigured Car
    Given i have already set up a new polo car model with configured options

  Scenario: Generating a Shortcode URL for my car
    When i click on the button to generate a shortcode
    Then i should see a text field appear containing a URL for my configured car
    And when i open a new browser window and navigate to this shortcode URL
    Then i should see my car configuration reload in my browser

  Scenario: Linking my car to Book a test drive
    When i click on the link to Book a Test Drive
    Then i should see the select retailer step of booking a test drive load in my browser
    And i should see my car details have already been entered on the first step panel

  Scenario: Linking my car to finance calculator
    When i select the link to view the finance calculator
    Then i should see the main finance calculator page load with information about my car model


  Scenario: Saving Configuration Without Login
    Given i have not logged into my account
    When i click on the button to save my car configuration
    And i enter a name of "Bobskin" to the text field that appears
    And i click on the button to save the configuration
    Then i should see the login page appear in my web browser

  @login
  Scenario: Saving Configuration when logged in
    Given i log into my VW Personal account
    And i return to my previously configured car that i was editing
    When i click on the link to save the configuration to my account
    And i enter a name of "Bobskin" to the field that appears
    And i click on the save button
    Then i should see my car configuration has been added to my profile page
