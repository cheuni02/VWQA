@vw-dogs @Daily
Feature: Dogs rediirect
  As we have removed the dogs main page from the website
  We need to make sure that when customers try to visit the page
  they are redirected back to main WV range page

  Scenario: Navigating to the dogs page
    When i go to the old dogs page through the URL in my browser
    Then i should be redirected back to the new car range page
