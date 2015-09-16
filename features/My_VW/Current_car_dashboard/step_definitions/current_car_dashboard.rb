Given /^that i have logged in to my account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @current_car.login_to_account
end

When /^the current car dashboard is loaded$/ do
  raise AssertionError, "Current car dashboard not loaded" unless @current_car.current_dashboard_section
end

Then /^I should be greeted with my name$/ do
  raise AssertionError, "My name not present" unless @current_car.my_name_present
end


When /^I select "Car health" button$/ do

end

Then /^the "Car health" module is displayed$/ do

end
=begin
When /^I click on the camera icon$/ do

end

Then /^the system file selector is displayed to choose a photo$/ do

end

And /^i am on the car health module$/ do

end

When /^i check to see my car health$/ do

end

Then /^i should see my car health details$/ do

end

And /^my next actions$/ do

end

When /^i click on a (*)$/ do |gurantee|

end

Then /^i should be taken to the relevant page$/ do

end

When /^i am on the service history module$/ do

end

Then /^i should see my vehicles service history$/ do

end

When /^i am on the my plans section$/ do

end

Then /^i should see any plans that i have$/ do

end

When /^i am on the prom modules section$/ do

end

Then /^i should see the (*)$/ do |promotions|

end

When /^i am on need help module$/ do

end

Then /^i should see the search bar and following (*)$/ do |useful_links|

end

When /^i am on the Current dashboard$/ do

end

Then /^i should see my preferred retailer and the following (*)$/ do |links|

end

When /^i scroll to the bottom of the page$/ do

end

Then /^the relevant dashboard (*) should appear$/ do |buttons|

end
=end
