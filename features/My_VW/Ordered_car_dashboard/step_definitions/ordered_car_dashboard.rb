Given /^i have logged in with a (.*) and (.*)$/ do |username, password|
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @current_car.set_username.set(username)
  @current_car.set_password.set(password)
  @current_car.click_login_button
end

And /^am on the ordered car dashboard page$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

When /^i check the status of my order$/ do
  raise AssertionError, "Status of my order is not present" unless @ordered_car.title_present
 end

Then /^i should see the (.*)$/ do |status|
  raise AssertionError, "Status of my order is not correct" unless @browser.title_text =~ /#{status}/
end
#
# Then /^the system file selector is displayed to choose a photo$/ do
#   #@current_car.upload_image_prompt
#   pending
# end
#
# When /^i am on the service gurantee module$/ do
#   raise AssertionError, "Service gurantee section not present" unless @current_car.my_service_gurantee_module
# end
#
# And /^i click on a (.*) link$/ do |gurantee|
#   @current_car.click_a_gurantee(gurantee)
# end
#
# Then /^i should be taken to the relevant (.*)$/ do |page|
#   raise AssertionError, "Page not relevant" unless @current_car.check_page_url(page)
# end
#
# When /^i am on the service history module$/ do
#   raise AssertionError, "My Service history module not present" unless @current_car.my_service_history
# end
#
# Then /^i should see my vehicles service history$/ do
#   raise AssertionError, "My service information not present" unless @current_car.my_service_history_table
# end
#
# When /^i am on the my plans section$/ do
#   raise AssertionError, "My plans section not present" unless @current_car.my_plans
# end
#
# Then /^i should see any plans that i have$/ do
#   pending
# end
#
# When /^i am on the promo modules section$/ do
#   raise AssertionError, "Promo section not present" unless @current_car.promo_section
# end
#
# Then /^i should see the (.*) promotion$/ do |promotions|
#   raise AssertionError, "promotion not present" unless @current_car.promotions_check(promotions)
# end
#
# And /^the promotion headline$/ do
#   raise AssertionError, "promotion headline is not there" unless @current_car.promo_headline_offer
# end
#
# When /^i am on need help module$/ do
#  raise AssertionError, "Need help section not present" unless @current_car.need_help_section
# end
#
# Then /^i should see the need help search bar$/ do
#   raise AssertionError, "Need help search bar not present" unless @current_car.need_help_search
# end
#
# And /^the following (.*) section appears$/ do |useful_links|
#   raise AssertionError, "Link not present" unless @current_car.check_useful_link(useful_links)
# end
#
# When /^i search for (.*)$/ do |help|
#   #@current_car.search_help(help)
#   pending
# end
#
# Then /^i should get a (.*)$/ do |result|
#   pending
# end
#
# When /^i am on the Current dashboard$/ do
#   step "the current car dashboard is loaded"
# end
#
# Then /^i should see my preferred retailer$/ do
#   raise AssertionError, "My preferred retailer not present" unless @current_car.my_retailer
# end
#
# And /^the (.*) link in the box$/ do |links|
#   raise AssertionError, "link not present" unless @current_car.retailer_links(links)
# end
#
# When /^i scroll to the bottom of the page$/ do
#   @current_car.scroll_to_recovery_zone
# end
#
# Then /^the (.*) button should appear for the user$/ do |buttons|
#   raise AssertionError, "Button not present" unless @current_car.check_relevant_buttons(buttons)
# end
