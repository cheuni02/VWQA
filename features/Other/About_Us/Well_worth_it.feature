@vw-plugin-cps-vw-section-about-us

  Feature: Checking the Well Worth it page
    As a potential buyer
    I want to know why i should get a volkswagen
    And is it worth it

      Background:
        Given i am on the Well worth it page

      Scenario: Validating the youtube videos
        When i check the youtube video elements have loaded on the page
        Then i should find that the main video has loaded successfully
        And when i check for the smaller youtube videos close to the page footer
        Then i should also find that these videos have loaded successfully

      Scenario Outline: Validating core images on page
        When i check if my image named <image_file_name> has loaded on the page
        Then i should find that the image is loaded and displayed in my browser window

        Examples:
        | image_file_name          |
        | soundproof-cabin.png     |
        | perfect-paint-finish.jpg |
        | laser-welded-body.jpg    |
        | monsoon-testing.jpg      |
        | steel-door-hinges.jpg    |

      Scenario Outline: Validating Volkswagen owners images
        When i check the Volkswagen owners images for an image named <image_name>
        Then i should find that the image is present and displayed inside the section

        Examples:
        | image_name     |
        | worth-it-1.jpg |
        | worth-it-2.jpg |
        | worth-it-3.jpg |
        | worth-it-4.jpg |
        | worth-it-5.jpg |
        | worth-it-6.jpg |
        | worth-it-7.jpg |
        | worth-it-8.jpg |
        | worth-it-9.jpg |

      Scenario: Checking buttons are present on the page
        When i check to see if the key buttons are on the page
        Then i should find that the buttons are present on the page

      Scenario: Checking to see if title and subheadings are present on the page
        When i check to see if the title is present on the page
        And the subheadings are present on the page
        Then i should find that the title and subheadings are displayed on the page
