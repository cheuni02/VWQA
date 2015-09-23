Given /^i have logged into my VW account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @configured_car = site.my_vw.configured_car_dashboard
  @current_car.visit
  @current_car.login_valid_account
end

When /^i am on the My cars page$/ do
  #Nothing to do here
end

Then /^i should be able to click on My Configurations link$/ do
  raise AssertionError, "My configurationn not present" unless @configured_car.configured_car_click
end

And /^i should be able to see My configuration on the page$/ do
  raise PageNotLoadedError, "My configuration page not loaded" unless @configured_car.configuration_page_present?
end

Given /^I have logged into my VW account$/ do
  @current_car.visit
  @current_car.login_valid_account
end

When /^i have gone to the My configurations page$/ do
  #Nothing to do here
end

Then /^i should be able to see the following (.*)$/ do |details|
  raise AssertionError, "Following section is not present" unless @configured_car.configured_car_sections_present?(details)
end

Given /^i have a logged into an account with a saved configuration$/ do
  step 'i have logged into my VW account'
end

When /^i am on the My configurations page$/ do
  #Nothing to do here
end

And /^i am viewing my configured car$/ do
  raise AssertionError, "my configured car not present" unless @configured_car.my_configured_car_present?
end

Then /^i should be able to see the book a test drive button$/ do
  raise AssertionError, " Book a test drive not present" unless @configured_car.book_test_drive_button_present?
end

And /^the (.*) link for my configured car$/ do |actions|
  raise AssertionError, "Link not present" unless @configured_car.configured_car_user_present?(actions)
end

Given /^i have logged into an account with a saved configuration that is no longer available$/ do
  pending
end

When /^i get to the My Configurations page$/ do
  #Nothing to do here
end

Then /^i should see the configuration and a message that says the configuration is no longer available$/ do
  pending
end

And /^(.*) for further actions i can take$/ do |links|
  pending
end

Given /^i have configured a car on the showrooms app and have logged in with the account$/ do
  pending
end

When /^i go to the My cars section$/ do
  #Nothing to do here
end

And /^click on the My Configurations links$/ do
  pending
end

Then /^i should see the configured car along with PDF download link$/ do
  pending
end

Given /^i am viewing my configuration$/ do
  step 'i have logged into my VW account'
  @configured_car.configured_car_click
end

When /^i am further down the page$/ do
  #Nothing to do here
end

Then /^i should see further action (.*)$/ do |buttons|
  raise AssertionError, "Button not present" unless @configured_car.configured_car_recovery_buttons_present?(buttons)
end

Given /^i am logged in and on the specification section$/ do
  step 'i have logged into my VW account'
  @configured_car.specification_section_present?
end

When /^i check to see if the table of data is present$/ do
  #Nothing to do here
end

Then /^i should also see links to the Dimensions and Terms and Conditions$/ do
  raise AssertionError, "Link not present" unless @configured_car.specifications_section_links_present?
end

Given /^i am logged in and the standard features section is present$/ do
  step 'i have logged into my VW account'
  @configured_car.standard_features_section_present?
end

When /^i click on the expand link$/ do
  @configured_car.click_expand_features_link
end

Then /^i should see the full list of standard features appear$/ do
  raise AssertionError, "Expanded standard features section not present" unless @configured_car.standard_features_expanded_present?
end
