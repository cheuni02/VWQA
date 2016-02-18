@WIPS
Feature: Checking GroupM tag availability
  As a required feature
  We want to ensure GroupM tag is available in different pages of the site.

  Scenario Outline: Checking GroupM tag is available in header of the site pages
  Given I visit <page_url> on the Volkswagen website
  When I check for the existence of the GRM Tags in the header
  Then I should find that the tags are present on the given page

  Examples:

  | page_url              |
  | /                     |
  | /new/range            |
  | /new/up-nf/home       |
  | /technology/engines   |
  | /need-help/contact-us |