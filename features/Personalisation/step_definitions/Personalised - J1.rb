Given /^i visit the Volkswagen Homepage$/ do
  site.clear_cookies
  site.visit_provineer
  site.set_cookies('pa', ENV['PCOOKIE'], {:path => "/ProvIM/ProvAnalytics/", :expires => Time.now + 86400, :secure => false})
  @personal = site.personalisation
  #site.homepage.dismiss_cookies
end

And /^i ensure that i have been selected to use the randomised personalisation flow$/ do
  #site.delete_cookie('pa')
  #site.set_cookies('pa', "01ba8776_14cd7bc8774_6e6d14cdc0d6728_7f000001", {:path => "/", :expires => Time.now + 86400, :secure => false})
  site.homepage.visit
  #site.set_cookies('vw-personalisation-panedcontent', '', {:path => "/", :expires => Time.now + 86400, :secure => false})
  #site.set_cookies('vw-personalisation-paragraph', '', {:path => "/", :expires => Time.now + 86400, :secure => false})
  site.set_cookies('ico-cookies', 'true', {:path => "/", :expires => Time.now + 86400, :secure => false})
  site.refresh_browser
  #this step is pending
end

When /^i observe the homepage loaded in my browser window$/ do
  #Standby Step
end

Then /^i should see the standard set of links present on the left side of the main page$/ do
  #sleep(5)
  elem1 = "I want to find a retailer"
  elem2 = "I need some help & support"
  raise ElementNotPresentError, "Could not find homepage text element #{elem1}" unless site.homepage.quick_link_present?(elem1) == 1
  raise ElementNotPresentError, "Could not find homepage text element #{elem2}" unless site.homepage.quick_link_present?(elem2) == 1
end

And /^i should also see the standard carousel item has been loaded on my web page$/ do
  pending
end

When /^i visit the car range selection page$/ do
  site.primary_nav.click_new_cars
end

And /^i select to view details about the (.*) Model$/ do |model|
  new_car = site.new_cars
  new_car.select_model(model)
  new_car.confirm_model
  new_car.wait_for_mlp_load
end

And /^i return back to the homepage$/ do
  site.homepage.visit
  #sleep(5)
  site.homepage.dismiss_cookies
end

Then /^i should see homepage links to "(.*)" and "(.*)"$/ do |link1, link2|
  site.homepage.wait_for_quicklinks
  raise ElementNotPresentError, "Could not find homepage quick link element #{link1}" unless site.homepage.quick_link_present?(link1) == 1
  raise ElementNotPresentError, "Could not find homepage quick link element #{link2}" unless site.homepage.quick_link_present?(link2) == 1
end

When /^i visit the car range page listing all the Volkswagen models$/ do
  #site.refresh_browser
  step "i visit the car range selection page"
end

And /^i select my (.*) from the list of models before returning to the homepage$/ do |model|
  step "i select to view details about the #{model} Model"
  step "i return back to the homepage"
end

Then /^i should see the (.*) image appear in my homepage carousel$/ do |image_name|
  #site.print_cookies
  site.refresh_browser
  sleep(5)
  raise ElementNotPresentError, "Could not find image with title #{image_name}" unless site.homepage.find_homepage_image(image_name)
end

But /^if i go back and change my select to be of (.*)$/ do |second_model|
  step "i visit the car range selection page"
  step "i select my #{second_model} from the list of models before returning to the homepage"
end

Then /^i should now see my homepage carousel update to contain (.*)$/ do |image_name|
  #site.refresh_browser
  step "i should see the #{image_name} image appear in my homepage carousel"
end























# --- Below Steps are Disabled ---



Given /^i visit the (.*) MLP page using the site navigation$/ do |model|
  step "i visit the car range selection page"
  step "i select to view details about the #{model} Model"
end

When /^i return to the homepage of the Volkswagen website$/ do
  site.homepage.visit
end

Then /^i should see the carousel displays an image named (.*)$/ do |image_name|
  raise ElementNotPresentError, "Could not find image with title #{image_name}" unless site.homepage.find_homepage_image(image_name)
end

Given /^i visit the car range page and select to view details about the "(.*)"$/ do |my_model|
  step "i visit the car range selection page"
  step "i select to view details about the #{my_model} Model"
end

When /^i navigate back to the VW homepage$/ do
  step "i return back to the homepage"
end

And /^i click on my personalised link to "(.*)"$/ do |link_text|
  raise ElementNotPresentError, "Could not find homepage quick link element #{link_text}" unless site.homepage.quick_link_present?(link_text)
  site.homepage.click_quick_link(link_text)
end

Then /^i should be taken to the book a test drive page for the "(.*)" Model$/ do |model|
  raise PageNotLoadedError, "Book Test drive page for model #{model} was not loaded!" unless site.book_test_drive.postcode_input_present?
end

Given /^i navigate to the MLP page for the "(.*)" Model on the VW Website$/ do |model|
  @model = model
  step "i visit the car range page and select to view details about the #{model}"
end

When /^i return to the site homepage once again$/ do
  step "i return back to the homepage"
end

And /^i click on my second personalised quick link to "(.*)"$/ do |link_text|
  step "i click on my personalised link to #{link_text}"
end

Then /^i should see the configure page in my browser load for the model i selected$/ do
  raise PageNotLoadedError, "Car Configurator Selection page not loaded for the #{@model} Model" unless site.new_cars.configure_page.page_loaded?
end
