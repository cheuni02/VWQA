Given /^i go to the new car range page to select the car model i want$/ do
  @newCar = site.new_cars
  @newCar.visit
end

Given /^i select to view more details of the (.*) car$/ do |car_model|
  @newCar.select_model(car_model)
  @newCar.confirm_model
end

When /^i click on the offer present in the main panel of the MLP Page$/ do
  raise AssertionError, "MLP offer not present" unless @newCar.mlp_offer_present
  @newCar.click_mlp_offer
end

Then /^i should see a page with more details of the offer shown in my browser$/ do
  raise AssertionError, "Offers table not present" unless site.finance_offers.offers_page.table_present?
end

Given /^i want to see the MLP page for the (.*) car$/ do |car_model|
  step "i select to view more details of the #{car_model} car"
end

When /^i click on the navigation link to explore$/ do
  raise AssertionError, "MLP navigation bar not available" unless @newCar.mlp_nav.main_nav_present
  @newCar.mlp_nav.select_primary_item("Features & style")
end

Then /^i should see a page load detailing features about the given car model$/ do
  raise PageNotLoadedError unless @newCar.explore_page.page_loaded?
end

Given /^i choose (.*) as the model of car i am interested in$/ do |car_model|
  step "i select to view more details of the #{car_model} car"
end

When /^i click on the nav bar link to the car models page$/ do
  raise AssertionError, "MLP navigation bar not available" unless @newCar.mlp_nav.main_nav_present
  @newCar.mlp_nav.select_primary_item("Models")
  @newCar.mlp_nav.select_secondary_item("Pricing & specifications")
end

Then /^i should see a page comparing all the derivates for my selected model$/ do
  raise PageNotLoadedError unless @newCar.car_models.page_loaded?
end

Given /^I have selected a car (.*) from the new cars page$/ do |car_model|
  step "i select to view more details of the #{car_model} car"
  @booktestdrive = site.book_test_drive
end

When /^I click on the Test Drive link in the nav bar$/ do
  raise AssertionError, "MLP navigation bar not available" unless @newCar.mlp_nav.main_nav_present
  @newCar.mlp_nav.select_primary_item("Test drive")
  @newCar.mlp_nav.select_secondary_item("Book a test drive")
end

Then /^I should see the 2nd step of the Book a Test Drive process$/ do
  raise PageNotLoadedError unless @booktestdrive.step2_info_present?
end
