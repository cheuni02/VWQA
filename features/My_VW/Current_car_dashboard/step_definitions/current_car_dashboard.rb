Given /^that i have logged in to my account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  site.my_vw.login.login(@account[0],@account[1])
end

When /^the current car dashboard page has loaded$/ do
  #Nothing to do here
end

Then /^I should be greeted with my current car dashboard and my name$/ do
  raise AssertionError, "My name not present" unless @current_car.my_name_present?
end

When /^I click on the camera icon$/ do
  #@current_car.click_camera_icon
  pending
end

Then /^the system file selector is displayed to choose a photo$/ do
  #@current_car.upload_image_prompt
  pending
end

Given /^the service gurantee module is present on the page$/ do
  #Nothing to do here
end

When /^i click on a (.*) link$/ do |gurantee|
  @current_car.click_a_gurantee(gurantee)
end

Then /^i should be taken to the relevant (.*)$/ do |page|
  raise AssertionError, "Page not relevant" unless @current_car.check_page_url(page)
end

When /^i am on the service history module$/ do
  #Nothing to do here
end

Then /^i should see my vehicles service history$/ do
  raise AssertionError, "My service information not present" unless @current_car.my_service_history_table_present?
end

When /^i am on the my plans section$/ do
  #Nothing to do here
end

Then /^i should see any plans that i have$/ do
  raise AssertionError, "My Plan table not present" unless @current_car.my_plans_present?
end

When /^i am on the promo modules section$/ do
  #Nothing to do here
end

Then /^i should see the (.*) promotion$/ do |promotions|
  raise AssertionError, "promotion not present" unless @current_car.promotions_present?(promotions)
end

And /^the promotion headline$/ do
  raise AssertionError, "promotion headline is not there" unless @current_car.promo_headline_offer_present?
end

When /^i am on need help module$/ do
  #Nothing to do here
end

Then /^i should see the need help search bar$/ do
  raise AssertionError, "Need help search bar not present" unless @current_car.need_help_search_present?
end

And /^the following (.*) section appears$/ do |useful_links|
  raise AssertionError, "Link not present" unless @current_car.check_useful_link_present?(useful_links)
end

When /^i search for (.*) in the need help section$/ do |help|
  #@current_car.search_help(help)
  pending
end

Then /^i should get a (.*) from my need help search$/ do |result|
  pending
end

When /^i am on the Current dashboard$/ do
  #Nothing to do here
end

Then /^i should see my preferred retailer$/ do
  raise AssertionError, "My preferred retailer not present" unless @current_car.my_retailer_present?
end

And /^the (.*) link in the box$/ do |links|
  raise AssertionError, "link not present" unless @current_car.retailer_links_present?(links)
end

When /^i scroll to the bottom of the page$/ do
  #Nothing to do here
end

Then /^the (.*) button should appear for the user$/ do |buttons|
  raise AssertionError, "Button not present" unless @current_car.check_relevant_buttons_present?(buttons)
end
