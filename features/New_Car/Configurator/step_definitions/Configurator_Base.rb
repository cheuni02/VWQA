Given /^i have returned to the VW Homepage$/ do
  site.homepage.visit
end

When /^i select the link to view the newest car models from Volkswagen$/ do
  site.primary_nav.click_new_cars
end

And /^i select the "(.*)" As the model of car i am interested in$/ do |model|
  site.new_cars.select_model(model)
  site.new_cars.confirm_model
end

And /^i select the navigation link to (.*) a new car of this model$/ do |link|
  site.new_car_nav.select_primary_item(link)
  site.new_car_nav.select_secondary_item("Build your model")
end

Then /^i should see a list of car variations based on my section$/ do
  raise unless site.new_cars.configure_page.page_loaded?
end

Given /^i have preselected a new car model and opted to configure it$/ do
  site.new_cars.configure_page.visit
end

When /^i select the "(.*)" Link below a variation i am interested in$/ do |link|
  site.new_cars.configure_page.show_first_info
end

Then /^i should see a panel open containing details about included features$/ do
  raise unless site.new_cars.configure_page.first_info_present?
end

And /^if i then click the link to view the full specification$/ do
  site.new_cars.configure_page.show_first_specification
end

Then /^i should see a panel open containing more specification details$/ do
  raise unless site.new_cars.configure_page.full_specification_present?
end

When /^i select to build a 3 door configuration of the car i want$/ do
  step "i have preselected a new car model and opted to configure it"
  site.new_cars.configure_page.select_first_car
end

Then /^i should be taken to the car configurator to specify more in depth options$/ do
  raise unless site.new_cars.configurator.loaded?
end
