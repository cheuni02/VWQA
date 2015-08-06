Given /^that I have a VW account$/ do
  @mycars = site.my_vw.profile
  @login = site.my_vw.login
  @mycars.visit
  @addcar = site.my_vw.add_car
end

And /^that its logged in$/ do
  @login.set_email(@account[0])
  @login.set_password(@account[1])
  @login.do_login
end

When /^I go to add a new car onto my Volkswagen Profile$/ do
  @mycars.add_car
end

Then /^it should load the add new car page in my browser$/ do
  raise AssertionError, "Unable to load Add Car page" unless @addcar.page_loaded?
end

When /^I enter details for my new car as if they are my current car$/ do
  step "I go to add a new car onto my Volkswagen Profile"
  @addcar.current_car
end

And /^I enter "(.*)" as the registration number$/ do |reg|
  @addcar.enter_reg(reg)
  @addcar.search_for_car
end

And /^I finish the registration$/ do
  @addcar.private_owned
  @addcar.new_car
  @addcar.enter_name("Test")
  @addcar.register_car
end

Then /^car should be displayed on the profile page$/ do
  raise AssertionError, "Unable to load My Cars page" unless @mycars.page_loaded?
  raise AssertionError, "New car not shown on page" unless @mycars.book_service_button_present?
end

And /^the cars details should be correct$/ do
  raise AssertionError, "Car name not correct" unless @mycars.check_name("Test").to_s == "Test"
end

When /^I enter details for my new car as if they are my previous car$/ do
  step "I go to add a new car onto my Volkswagen Profile"
  @addcar.previous_car
end

And /^I enter "(.*)" as my registration number$/ do |reg|
  @addcar.enter_reg(reg)
  @addcar.search_for_car
end

And /^I finish the process$/ do
  @addcar.enter_name("Test")
  @addcar.register_car
end

Then /^car should be displayed$/ do
  raise AssertionError, "Unable to load My Cars page" unless @mycars.page_loaded?
  raise AssertionError, "New car not shown on page" if @mycars.book_service_button_present?
end

And /^the details should be correct$/ do
  step "the cars details should be correct"
end

When /^I set the new car as my ordered car$/ do
  step "I go to add a new car onto my Volkswagen Profile"
  @addcar.ordered_car
end

And /^I enter "(.*)" as the order number$/ do |ordernumber|
  @addcar.enter_order_number(ordernumber)
end

And /^I finish the reg process$/ do
  @addcar.enter_ordered_car_name("Test")
  @addcar.register_car
end

Then /^ordered car should be displayed$/ do
  step "car should be displayed on the profile page"
end

And /^the details should be right$/ do
  step "the cars details should be correct"
end

When /^I set this car as my current car$/ do
  step "I go to add a new car onto my Volkswagen Profile"
  @addcar.current_car
end

And /^I enter "(.*)" as the reg number$/ do |reg|
  @addcar.enter_reg(reg)
  @addcar.search_for_car
end

And /^I finish the registration with a company car$/ do
  @addcar.company_owned
  @addcar.company_name("Test Company")
  @addcar.new_car
  @addcar.enter_name("Test")
  @addcar.register_car
end

Then /^the car should be displayed on the profile page$/ do
  step "car should be displayed on the profile page"
end

And /^these details should be correct$/ do
  step "the cars details should be correct"
end

When /^I set the car as my current car$/ do
  step "I go to add a new car onto my Volkswagen Profile"
  @addcar.current_car
end

And /^I enter "(.*)" as my reg number$/ do |reg|
  @addcar.enter_reg(reg)
  @addcar.search_for_car
end

And /^I finish the registration with a used car$/ do
  @addcar.private_owned
  @addcar.used_car
  @addcar.enter_name("Test")
  @addcar.register_car
end

Then /^the used car should be displayed on the profile page$/ do
  step "car should be displayed on the profile page"
end

And /^those details should be correct$/ do
  step "the cars details should be correct"
end
