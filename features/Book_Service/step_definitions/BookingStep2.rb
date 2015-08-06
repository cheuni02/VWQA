Given /^i select and confirm the location where i want my car to be serviced$/ do
  @serviceStep2 = site.book_service.booking_step2
  @serviceStep2.visit
  @serviceStep2.click_next_step
end

=begin
Given /^i have a broken down car in the "(.*)" area$/ do |location|
  site.homepage.visit
  @serviceStep1 = site.book_service.booking_step1
  @serviceStep1.visit
  @serviceStep1.set_location(location)
  @serviceStep1.location_search
end

When /^i select a car servicing building when looking to book a service$/ do
  @serviceStep1.select_random_location
  @serviceStep1.click_next_step
end

Then /^i should be presented with a form to enter my registration details$/ do
  @serviceStep2 = site.book_service.booking_step2
  raise unless @serviceStep2.page_loaded?
end
=end

When /^i submit my car registration details as "(.*)"$/ do |registration|
  @serviceStep2.set_registration(registration)
  @serviceStep2.submit_car_registration
end

Then /^i should see my car model name and date of manufacture appear in the form fields$/ do
  details = @serviceStep2.get_car_details
  details.each do |d|
    raise AssertionError, "Expected car details to be present in form fields!" if (d.nil? || d.length == 0)
  end
end

And /^i should see a button to allow me to correct my details if they are incorrect$/ do
  @serviceStep2.set_manual_details_present?
end

When /^i submit a car registration number of "(.*)"$/ do |registration|
  step "i submit my car registration details as \"#{registration}\""
end

Then /^i should see an error message informing me that my car details could not be found$/ do
  errors = @serviceStep2.getFormErrors
  raise AssertionError, "Expected Form Errors to be displayed with this input!" unless errors.length > 0
end

And /^i should also see fields for manually entering my car information present on the page$/ do
  raise ElementNotPresentError, "Form fields for car information not found" unless @serviceStep2.fields_present?
end

Given /^i enter a car registration number of "(.*)"$/ do |registration|
  step "i submit my car registration details as \"#{registration}\""
end

When /^i enter my mileage count as "(\d+)"$/ do |mileage|
  @serviceStep2.set_mileage(mileage)
end

And /^i submit my information to the page form$/ do
  @serviceStep2.click_next_step
end

Then /^i should be shown a list of service options and the price$/ do
  site.book_service.booking_step3.page_loaded?
end

Given /^i enter my car details again by using a registration number of "(.*)"$/ do |registration|
  step "i submit my car registration details as \"#{registration}\""
end

When /^i decide to adjust the details that have been detected$/ do
  @serviceStep2.click_change_details
end

Then /^i should be able to change my car model and its other details$/ do
  raise InvalidElementStateError, "Car details input disabled, expected input to be enabled" if @serviceStep2.car_model_disabled?
  @serviceStep2.set_car_model("Beetle")
end

And /^if i then enter a mileage count of "(\d+)" before submitting the form$/ do |mileage|
  step "i enter my mileage count as \"#{mileage}\""
end

Then /^i should be able to proceed to the next step of booking a car service$/ do
  step "i submit my information to the page form"
  step "i should be shown a list of service options and the price"
end

Given /^i enter my cars registration number as "(.*)"$/ do |registration|
  step "i submit my car registration details as \"#{registration}\""
end

When /^i set my car to be a leased car that i do not own$/ do
  @serviceStep2.set_leased_car
end

Then /^i should see a text field requiring me to enter which company i leased the car from$/ do
  @serviceStep2.lease_company_field_present?
end

And /^if i enter that company name as "(.*)" And proceed to the next stage$/ do |company|
  @serviceStep2.set_lease_company(company)
  step "i submit my information to the page form"
end

Then /^i should be able to continue with choosing my car service options$/ do
  step "i should be shown a list of service options and the price"
end

Given /^i enter my car registration number as "(.*)"$/ do |registration|
  step "i submit my car registration details as \"#{registration}\""
end

When /^i enter the car model information as (.*) with a derivative of (.*)$/ do |model, derivative|
  @serviceStep2.set_car_model(model)
  @serviceStep2.set_car_derivative(derivative)
end

And /^i enter the cars engine capacity as (.*) and manufacture year of (.*)$/ do |engine, year|
  @serviceStep2.set_car_engine(engine)
  @serviceStep2.set_car_manufacture_year(year)
end

And /^i set the cars transmission to (.*) and its fuel type (.*)$/ do |transmission, fuel|
  @serviceStep2.set_transmission_auto if transmission =~ /Automatic/i
  @serviceStep2.set_transmission_manual if transmission =~ /Manual/i
  @serviceStep2.set_fuel_petrol if fuel =~ /petrol/i
  @serviceStep2.set_fuel_diesel if fuel =~ /diesel/i

end

And /^i give a mileage value of (.*) in the form provided$/ do |mileage|
  #step "i enter my mileage count as \"#{mileage}\""
  @serviceStep2.set_mileage(mileage)
end

Then /^i (.*) be able to continue with my service booking when i try to continue$/ do |proceed|
  step "i submit my information to the page form"
  if proceed =~ /not/i
    raise PageNotLoadedError, "Step 2 of booking a service was not loaded!" unless @serviceStep2.page_loaded?
  else
    raise PageNotLoadedError, "Step 3 of booking a service was not loaded!" unless site.book_service.booking_step3.page_loaded?
  end
end
