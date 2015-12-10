@vw-plugin-cps-vw-section-used-cars @Daily
  Feature: Used Cars Page
    As a potential used car buyer
    I want to be able to see why i should buy a Volkswagen used car
    And what they can offer

      Background: Given i am on the used cars page
        Given i am on the used cars page

      Scenario Outline: Validating that video thumbnail images are on the page
        When i check that the <thumbnail> is present on the page
        Then I should find that the images have loaded properly

        Examples:
        |thumbnail               |
        |img-youtube-thumb.jpg   |
        |no-quibbles.jpg         |
        |img-youtube-thumb-2.jpg |

      Scenario: Validating if Youtube videos are on the page
        When i check to see if the youtube videos exist on the page
        Then i should see that the youtube videos are present on the page

      Scenario: Checking the Das WeltAuto benefits section
        When i click on the Das WeltAuto benefits button
        Then the benefits sections should have loaded on the page sucessfully

      Scenario Outline: Validating the images on the Das WeltAuto benefits section
        When i click on the Das Wel button to load the benefits section
        Then the <benefit> image should load

        Examples:
        |benefit           |
        |img-12.png        |
        |img-info.png      |
        |img-excl-mark.png |
        |img-7.png         |
        |img-money.png     |

      Scenario: Checking the external link to used cars is present
        When I check if the Search used cars link is present on the page
        Then i should see that the link is successfully on the page
