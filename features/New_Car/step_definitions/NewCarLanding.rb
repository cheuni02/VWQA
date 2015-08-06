Given /^i visit the new car landing page by clicking on the top level navigation link$/ do
  @newCarLanding = site.new_cars
  @newCarLanding.visit
end

Given /^i am a new VW user on the homepage of the website$/ do
  site.homepage.visit
end

When /^i click on the New Cars link in the top level nav$/ do
  site.primary_nav.click_new_cars
end

Then /^i should see the list of Volkswagen car models appear in my browser$/ do
  raise unless @newCarLanding.page_loaded?
end


When /^i click the link to view the list of cars as a horizontal strip$/ do
  @newCarLanding.set_horizontal_view
end

Then /^i should see the new car listing change and display as a horizontal strip$/ do
  raise unless @newCarLanding.go_to_end_button_present?
end

When /^i change the car order filter to (.*) using the select dropdown on the page$/ do |filter|
  @newCarLanding.set_car_order(filter)
end

Then /^i should see (.*) appearing as the first car in the list of items$/ do |expected_model|
  @newCarLanding.wait_for_range_load
  raise unless @newCarLanding.get_first_model_name =~ /#{expected_model}/i
end

When /^i click on the car model named (.*) on the new car landing page$/ do |model|
  @newCarLanding.select_model(model)
end

Then /^i should see a panel containing a context description of the car$/ do
  @newCarLanding.car_detail_panel_present?
end

And /^i should also see the pricing and detailed information of that cars performance$/ do
  raise unless @newCarLanding.car_price_info_present?
  raise unless @newCarLanding.car_size_info_present?
  raise unless @newCarLanding.car_performance_info_present?
  raise unless @newCarLanding.car_efficiency_info_present?
end

But /^if i click on the link to view even more details about this car$/ do
  @newCarLanding.confirm_model
end

Then /^i should be taken to the main landing page view for this car model$/ do
  raise unless @newCarLanding.mlp_loaded?
end
