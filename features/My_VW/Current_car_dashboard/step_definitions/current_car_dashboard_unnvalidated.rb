Given /^that i have logged in to my unvalidated VW account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @current_car.login_unvalidated_account
end

When /^i am on the MY VW page for my account$/ do
  raise PageNotLoadedError, "My VW page not loaded" unless @current_car.my_vw_page_present?
end

Then /^i should see the My Service history & plans module$/ do
  raise AssertionError, "My Plans and Service history section not present" unless @current_car.my_service_plans_box
end

And /^I should see the last name and postcode input fields$/ do
  raise AssertionError, "Fields not present" unless @current_car.dbg_data_needed_present?
end
