
Given /^i am logged in with correct account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.login_account_ordered
 end

And /^i am on the ordered car dashboard page with car which is on step (.*)$/ do |step|
  @ordered_car.my_cars_hover
  @ordered_car.get_ordered_car_step(step)
  @ordered_car.refresh_browser_on_step
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

When /^i check the status of my order$/ do
  raise AssertionError, "Status of my order is not present" unless @ordered_car.title_present
end

Then /^i should see the (.*)$/ do |status|
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text =~ /#{status}/
end

And /^i should see step (.*) active$/ do |step|
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step =~ /#{step}/
  @ordered_car.logout
end
