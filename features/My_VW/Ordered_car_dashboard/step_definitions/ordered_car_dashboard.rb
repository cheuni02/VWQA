Given /^i am logged in with correct account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.login_account_ordered
 end

And /^i am on the ordered car dashboard page with car which is on step (.*)$/ do |step_number|
  link = @ordered_car.get_ordered_car_step(step_number)
  raise InvalidElementStateError, "Could not locate ordered car with step number #{step_number}" if link.nil?
  @ordered_car.goto_my_car_url(link)
  @ordered_car.ordered_dashboard_section_present?
end

When /^i check the status of my order$/ do
  @ordered_car.title_present?
end

Then /^i should see the (.*)$/ do |status|
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text =~ /#{status}/
end

And /^i should see step (.*) active$/ do |step|
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step =~ /#{step}/
end
