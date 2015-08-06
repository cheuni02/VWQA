@vw-plugin-cps-vw-section-fleet @Disabled
Feature: Fleet - Request a demo
  As part of the site features for business users
  We need to provide a way of booking a test drive
  So that business users can test drive a preferred model

Background: Showing the Fleet Require A Demo page
  Given i am viewing fleet require a demo page on the website

  Scenario: Verify elements on Fleet Request a demo page
    Then i should see all the required sections on the page

  Scenario Outline: Submit Request a demo form with different sets of information
    When i set my business details, company name as <companyName> and job title as <jobTitle>
    And i set my personal details, name as <title> <firstName> <surname>, email address as <email> and telephone as <telephone> into the relevant fields
    And i set information about fleet, fleet size as <fleetSize>, car as <car>, preferred date as <preferredDate> and additional information as <additionalInfo>
    And i set the ways VW will contact me, such as <emailPost>, <telephone>, <textMessage> or <post>
    And i set if other organisations will contact me <otherOrganisations>
    And i click on the Submit button to send my form
    Then i should see the <complete> page appear in my browser window
  Examples:
    | companyName | jobTitle    | title | firstName | surname   | email                   | telephone    | fleetSize | car        | preferredDate | additionalInfo | emailPost | textMessage | post | otherOrganisations | complete          |
    | Company 1   | Manager     | Mr    | John      | Smith     | email1@testtribal.com   | 0880 123456  | 1-24      | New Passat | tomorrow      | test additional| yes       | yes         | yes  | yes                | Thank you         |
    | Company 2   | Manager     | Mrs   | John      | Smith     | email1@testtribal.com   | 0880 123456  | 1-24      | up!        |               |                | no        | no          | no   | no                 | Thank you         |
    |             | Clerk       | Miss  | John      | Doe       | email2@testtribal.com   | 0880-123456  | 25-50     | New Polo   | nextmonth     |                | no        | yes         | yes  | no                 | Request Form      |
    | Company 3   |             | Ms    | Luba      | Verner    | email3@testtribal.com   | 0880-123-456 | 51-200    | Golf       | today         | additional info| no        | no          | yes  | no                 | Request Form      |
    | Company 4   | Technician  | Dr    |           | Tomasi    | email4@testtribal.co.uk | 0800-123 456 | 201+      | Golf SV    | nextyear      | info           | no        | no          | no   | yes                | Request Form      |
    | Company 5   | Salesman    | Prof  | Eve       |           | email5@testtribal.de    | 123456       | other     | Eos        | yesterday     |                | no        | no          | no   | no                 | Request Form      |
    | Company 6   | Retailer    | Lord  | Orlando   | Counts    |                         | +412345 789  | 1-24      | Touran     | tomorrow      |                | yes       | yes         | no   | no                 | Request Form      |
    | Company 7   | Banker      | Lady  | Heather   | Furby     | email6@testtribal.com   |              | 25-50     | Sharan     | nextyear      | Leather seats  | yes       | no          | yes  | no                 | Request Form      |
    | Cömpäny 8   | Bänker      | Mr    | Jürgen    | Schrötter | email_7@testtribal.com  | +44251 25 46 | other     | Phaeton    |               |                |           |             |      |                    | Thank you |
    | ~!@#$%^&*()+=`[]{};'\:",./<>?_ | ~!@#$%^&*()+=`[]{};'\:",./<>?_ | | ~!@#$%^&*()+=`[]{};'\:",./<>?_ | ~!@#$%^&*()+=`[]{};'\:",./<>?_ | email8@testtribal.com | 400112012 | | | | ~!@#$%^&*()+=`[]{};'\:",./<>?_| | | | | Thank you |
    | Test maximum lenght of the  mandatory  Company Name | Test maximum lenght ofthe mandatory Job Title field | Miss | TestMaximLenghtOfFirstNameField | TestMaximumLenghtOfSurnameField | email9@testtribal.com | +44 0880 23145 45542 4457 55845 | 1-24 | Golf |  |  |  |  |  |  | Request Form |

  Scenario: Verify Privacy Policy on Request a demo page
    When i get the mouse over privacy policy link on request a demo page
    Then i should see the privacy policy as popup on request a demo page

  Scenario: Verify that the error messages are displayed on Request a demo page
    When i submit the request a demo form having required fields empty
    Then i should be still on request a demo page
    And i should see a validation message for each mandatory field
