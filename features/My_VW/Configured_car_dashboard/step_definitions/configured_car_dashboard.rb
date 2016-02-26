Given /^I have loaded the My VW section$/ do
  @current_car = site.my_vw.current_car_dashboard
  @configured_car = site.my_vw.configured_car_dashboard
  @current_car.visit
end

And /^i have logged into my VW account$/ do
  site.my_vw.login.login(@account[:username], @account[:password])
end

When /^i am on the My cars page$/ do
  # Nothing to do here
end

Then /^i should be able to click on My Configured car link$/ do
  @configured_car.click_configuration
end

And /^i should be able to see My configuration on the page$/ do
  fail PageNotLoadedError, 'My configuration page not loaded' unless @configured_car.configuration_page_present?
end

Given /^I have logged into my own VW account$/ do
  step 'i have logged into my VW account'
end

When /^i have gone to the My configuration page$/ do
  @configured_car.click_configuration
end

Then /^i should be able to see the following (.*)$/ do |details|
  fail AssertionError, 'Following section is not present' unless @configured_car.configured_car_sections_present?(details)
end

And /^i have a logged into an account with a saved configuration$/ do
  step 'i have logged into my VW account'
end

When /^i am on the My configured car dashboard page$/ do
  @configured_car.click_configuration
end

And /^am viewing my configured car$/ do
  fail AssertionError, 'my configured car not present' unless @configured_car.my_configured_car_present?
end

Then /^i should be able to see the book a test drive button$/ do
  fail AssertionError, 'Book a test drive option not present' unless @configured_car.book_test_drive_button_present?
end

And /^the edit and print configurations links appear$/ do
  fail AssertionError, 'Link not present' unless @configured_car.configuration_links_present?
end

Given /^i have logged into an account with a saved configuration that is no longer available$/ do
  pending
end

When /^i get to the My Configuration page$/ do
  pending
end

Then /^i should see the configuration and a message that says the configuration is no longer available$/ do
  pending
end

And /^a further action such as (.*)$/ do |_links|
  pending
end

Given /^i have configured a car on the showrooms app and have logged in with the account$/ do
  pending
end

When /^i go to the My cars section$/ do
  pending
end

And /^click on the My Configurations links$/ do
  pending
end

Then /^i should see the configured car along with PDF download link$/ do
  pending
end

And /^i am viewing my configuration$/ do
  step 'i have logged into my VW account'
  @configured_car.click_configuration
end

When /^i am further down the page$/ do
  # Nothing to do here
end

Then /^i should see a further action such as (.*)$/ do |buttons|
  fail AssertionError, 'Button not present' unless @configured_car.configured_car_recovery_buttons_present?(buttons)
end

Given /^i am logged in and on the specification section$/ do
  step 'i have logged into my VW account'
  @configured_car.click_configuration
  @configured_car.specification_section_present?
end

When /^i check to see if the table of data is present$/ do
  # Nothing to do here
end

Then /^i should also see links to the Dimensions and Terms and Conditions$/ do
  fail AssertionError, 'Link not present' unless @configured_car.specifications_section_links_present?
end

Given /^i am logged in and the standard features section is present$/ do
  step 'i have logged into my VW account'
  @configured_car.click_configuration
  @configured_car.standard_features_section_present?
end

When /^i click on the expand link$/ do
  @configured_car.click_expand_features_link
end

Then /^i should see the full list of standard features appear$/ do
  fail AssertionError, 'Expanded standard features section not present' unless @configured_car.standard_features_expanded_present?
end

Given /^i have scrolled down the page$/ do
  step 'i have logged into my VW account'
  @configured_car.click_configuration
end

When /^i see the the configuration link section$/ do
  # Nothing to do here
end

Then /^i should see my configuration shortcode$/ do
  fail AssertionError, 'Shortcode not present' unless @configured_car.shortcode_present?
end
