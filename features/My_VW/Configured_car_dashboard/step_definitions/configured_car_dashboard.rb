Given /^i have logged into my VW account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @configured_car = site.my_vw.configured_car_dashboard
  @current_car.visit
  @current_car.login_valid_account
end

And /^i am on the My cars page$/ do
  raise AssertionError, "My Cars page not loaded" @current_car.current_dashboard_section
end

Then /^i should be able to click on My Configurations link$/ do
  raise AssertionError, "My configurationn not present" unless @configured_car.configured_car_click
end

And /^i should be able to see My configuration on the page$/ do
  raise PageNotLoadedError, "My configuration page not loaded" unless @configured_car.configuration_page
end

Given /^I have logged into my VW account$/ do
  @current_car.visit
  @current_car.login_valid_account
end

When /^i have gone to the My configurations page$/ do
  step "i am on the My cars page"
end

Then /^i should be able to see the following (.*)$/ do |details|
  raise AssertionError, "Following section is not present" unless @configured_car.configured_car_section(details)
end

Given /^i have a logged into an account with a saved configuration$/ do
  step 'i have logged into my VW account'
end

When /^i am on the My configurations page$/ do
  step "i am on the My cars page"
end

Then /^i should be able to see my configured car$/ do
  raise AssertionError, "my configured car not present" unless @configured_car.my_configured_car
end

And /^further details and (.*) i can take$/ do |actions|
  pending
end

Given /^i have logged into an account with a saved configuration that is no longer available$/ do
  pending
end

When /^i get to the My Configurations page$/ do
  pending
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
  pending
end

And /^click on the My Configurations links$/ do
  pending
end

Then /^i should see the configured car along with PDF download link$/ do
  pending
end

Given /^i am viewing my configuration$/ do
  pending
end

When /^i am further down the page$/ do
  pending
end

Then /^i should see further action (.*)$/ do |buttons|
  pending
end
