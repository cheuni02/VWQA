Given /^i have already set up a new polo car model with configured options$/ do
  @configurator = site.new_cars.configurator
  @configurator.visit_complete_config
end

When /^i click on the button to generate a shortcode$/ do
  @configurator.overview_click_shortcode
end

Then /^i should see a text field appear containing a URL for my configured car$/ do
  @configurator.shortcode_url_present?
  @shortcode = @configurator.get_shortcode_url

  raise unless @shortcode.length != 0
end

And /^when i open a new browser window and navigate to this shortcode URL$/ do
  @configurator.visit_shortcode(@shortcode)
end

Then /^i should see my car configuration reload in my browser$/ do
  raise unless @configurator.overview_car_name =~ /Rock up\!/i
  raise unless @configurator.loaded?
end

When /^i click on the link to Book a Test Drive$/ do
  @configurator.click_overview_test_drive
end

Then /^i should see the select retailer step of booking a test drive load in my browser$/ do
  @testDrive = site.book_test_drive

  raise unless @testDrive.postcode_input_present?
end

And /^i should see my car details have already been entered on the first step panel$/ do
  raise unless @testDrive.car_details_present?
end

When /^i select the link to view the finance calculator$/ do
  @configurator.click_overview_finance_calculator
end

Then /^i should see the main finance calculator page load with information about my car model$/ do
  raise unless site.finance_offers.finance_calculator.main_page_loaded?
end

Given /^i have not logged into my account$/ do
end

When /^i click on the button to save my car configuration$/ do
  @configurator.overview_save_configuration
end

And /^i enter a name of "(.*)" to the text field that appears$/ do |car_name|
  @configurator.set_save_configuration_name(car_name)
end

And /^i click on the button to save the configuration$/ do
  @configurator.save_configuration
end

Then /^i should see the login page appear in my web browser$/ do
  raise unless site.my_vw.login.page_loaded?
end

Given /^i log into my VW Personal account$/ do
  @login = site.my_vw.login
  @login.visit
  @login.set_email(@account[:username])
  @login.set_password(@account[:password])
  @login.do_login
end

And /^i return to my previously configured car that i was editing$/ do
  @configurator.visit_complete_config
end

When /^i click on the link to save the configuration to my account$/ do
  step "i click on the button to save my car configuration"
end

And /^i enter a name of "(.*)" to the field that appears$/ do |car_name|
  step "i enter a name of \"#{car_name}\" to the text field that appears"
end

And /^i click on the save button$/ do
  step "i click on the button to save the configuration"
end

Then /^i should see my car configuration has been added to my profile page$/ do
  @profile_configs = site.my_vw.my_configurations
  @profile_configs.visit
  #raise PageNotLoadedError, "Saved configurations page not loaded" unless @profile_configs.page_loaded?
  raise AssertionError, "No Saved Configurations shown on My Configurations Page" if @profile_configs.no_configs_shown?
end
