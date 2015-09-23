Given /^i have logged into my VW account and am on the My VW page$/ do
  @current_car = site.my_vw.current_car_dashboard
  @add_car = site.my_vw.add_current_car
  @current_car.visit
  @current_car.login_valid_account
end

And /^i go to the add a car page and click on the "A car i own" button$/do
  @add_car.select_add_car
  @add_car.click_i_own_car_button
end

When /^i check that am on the Add a car i own page$/ do
  #nothing to do
end

Then /^i should see the registration field appear$/ do
  raise AssertionError, "registration field not present" unless @add_car.registration_field_present?
end

When /^i enter a (.*) in the input field$/ do |registration|
  @add_car.enter_registrations(registration)
end

Then /^i should see a (.*) message if the registration needs to be reviewed$/ do |error|
  if error = fail
  raise AssertionError, "Error message present" unless @add_car.error_message_present?
  end
end

When /^i enter one of my (.*)$/ do |registrations|
  @add_car.enter_valid_registrations(registrations)
end

And /^click the lookup button$/ do
  @add_car.click_registration_lookup_button
end

Then /^i should see a message saying think we've found your car$/ do
  raise AssertionError, "Found car message not present" unless @add_car.found_car_text_present?
end

When /^i have completed steps 1a and 1b$/ do
  @add_car.step_1a_b
end

And /^have selected the used car button and given it a name$/ do
  @add_car.click_user_car_button
  @add_car.enter_car_name
end

Then /^after i click continue i should be taken to a page asking me to select a retailer$/ do
  raise AssertionError, "Continue button not present" unless @add_car.continue_to_step_2
end

When /^i have completed steps 1a, b and click on the edit link in the My cars box$/ do
  step "i have completed steps 1a and 1b"
end

And /^i fill in the required details such as (.*), (.*), (.*), (.*)$/ do |day, month, year, engine_size|
  
end

Then /^i should see a error message to let me know if i need to review any details$/ do

end

When /^i finished completing steps 1a, b, c$/ do

end

And /^search for a retailer using a (.*) and click the lookup button$/ do |postcode|

end

Then /^i should see a list of retailers in a list$/ do

end

And /^a map view of the retailer as well$/ do

end

When /^i have completed Step 1a, b, c$/ do

end

And /^search for a retailer using a (.*)$/ do |retailer_name|

end

Then /^i should be able to select that retailer$/ do

end

When /^i have finished all the steps until selecting a retailer$/ do

end

And /^i select my retailer and click the continue button$/ do

end

Then /^i should be able to see Step 3 Registered owner details$/ do

end

When /^i have completed Steps 1 and 2$/ do

end

And /^i click the Skip & finish button$/ do

end

Then /^i should see the car in the owned cars section$/ do

end

When /^i have completed Steps 1 and 2 for adding a car i own$/ do

end

And /^i enter my (.*) and (.*)$/ do |last_name, postcode|

end

Then /^i should get an error message if it can not find a record$/ do

end

When /^i have complete Steps 1 and 2 for adding my car$/ do

end

And /^i enter my last name and postcode$/ do

end

Then /^after i click finish i should see my car in the owned cars section$/ do

end
