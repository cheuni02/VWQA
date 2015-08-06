Given /^i am on the order tracking page on the VW Website$/ do
  @orders = site.owners.orders_status
  @orders.visit
end

Given /^i am starting from the VW Homepage$/ do
  site.homepage.visit
end

When /^i click on the top level navigation link to view the Owners landing page$/ do
  site.primary_nav.click_owners
end

And /^i click on the button to try and track my order without entering a number$/ do
  site.owners.find_order_number
end


Then /^i should be taken to the order tracking page on the website$/ do
  raise unless @orders.page_loaded?
end


When /^i search for a non existant order number of "(\d+)"$/ do |order_number|
  @orders.find_order(order_number)
end

Then /^i should see an error presented in my browser window$/ do
  test = @orders.get_errors
  raise if test == ""
end


When /^i submit my valid order number of "(\d+)" into the tracking field$/ do |order_number|
  step "i search for a non existant order number of \"#{order_number}\""
end

Then /^i should see a page appear containing information about the current progress of my order$/ do
  raise unless @orders.car_details_present?
  raise unless @orders.retailer_details_present?
end


When /^i submit a different valid order number for my VW Car of "(.*)"$/ do |order_number|
  step "i search for a non existant order number of \"#{order_number}\""
end

And /^i click on the link to sign up for alerts about my VW Build order$/ do
  @orders.click_alert_signup
end

Then /^i should see the login page load in my browser window$/ do
  raise unless site.my_vw.login.page_loaded?

end

When /^i submit my VW Car order number of "(.*)"$/ do |order_number|
  @orderNumber = order_number
  step "i search for a non existant order number of \"#{@orderNumber}\""
end

And /^i click on the link to sign up for alerts on my order$/ do
  @orders.click_alert_signup
  site.my_vw.login.set_email(@account[0])
  site.my_vw.login.set_password(@account[1])
  site.my_vw.login.do_login
end

And /^i fill in the save my car details on the new car field$/ do
  @profile = site.my_vw.profile
  @profile.set_car_order_number(@orderNumber)
  @profile.set_new_car_name("AutomatedCar#{Time.now.to_i}")
  @profile.save_new_car
end

Then /^i should see a button allowing me to setup email alerts$/ do
  raise unless @profile.email_alert_button_present?
end

And /^if i click the setup button$/ do
  @profile.click_email_alert_button
end

And /^i set my email to "(.*)" and accept the sign up form$/ do |email|
  @profile.set_alert_email(email)
  @profile.accept_terms
  @profile.save_alert_settings
end

Then /^i should be taken back to the main profile page of my login$/ do
  raise unless @profile.page_loaded?
end
