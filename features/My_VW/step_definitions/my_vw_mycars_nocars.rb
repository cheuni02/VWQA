Given /^I have gone to the profile page$/ do
  @mycars = site.my_vw.profile
  @login = site.my_vw.login
  @mycars.visit  
end

When /^I have logged in on a profile with no cars attached$/ do  
  @login.set_email(@account[0])
  @login.set_password(@account[1])
  @login.do_login
end

Then /^the profile page should be loaded with just an Add Car button$/ do
  raise unless @mycars.page_loaded?
  raise unless @mycars.add_car_button_present?
end

Given /^I am on the profile page$/ do
  step "I have gone to the profile page"
  step "I have logged in on a profile with no cars attached"
end

When /^I click on the Add Car link$/ do
  @mycars.add_car
end

Then /^the add car page should load correctly$/ do
  raise unless site.my_vw.add_car.page_loaded?  
end