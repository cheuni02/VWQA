Feature: Checking conversion tag through JS execution
  As an optional feature
  We want to fire off javascript
  And check the results to ensure that the execution was successful

  Scenario: Executing JS
    Given I am on the configurator page
    When I execute the javascript as part of the conversion
    Then it should fire off the tag
    And the response is correct