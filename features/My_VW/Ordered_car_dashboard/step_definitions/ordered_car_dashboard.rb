
Given /^that i am logged in with correct account$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.visit
  @ordered_car.login_account_ordered
end


# Step 1 Order processing

When /^i have logged into an account with a user who has an ordered car which is on step 1$/ do
@ordered_car = site.my_vw.ordered_car_dashboard
@ordered_car.go_to_ordered_car_step("Step1")
raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 1$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("1\nProcessing your order")
end

And /^i should see the text "Your order is being processed" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your order is being processed")
end

And /^a step description with a link to setup alerts in Step 1 if not setup already$/ do
  @ordered_car.logout
end


# Step 2 With the Factory


When /^i have logged into an account with a user who has an ordered car which is on step 2$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.go_to_ordered_car_step("Step2")
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 2$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("2\nWith the factory")
end

And /^i should see the text "Your order is with the factory" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your order is with the factory")
end

And /^a step description with a link to setup alerts in Step 2 if not setup already$/ do
  # step"a step description with a link to setup alerts in Step 1 if not setup already"
  @ordered_car.logout
end

# Step 3 Build Scheduled
#
# When /^i have logged into an account with a user who has an ordered car which is on step 3$/ do
#   @ordered_car = site.my_vw.ordered_car_dashboard
#   @ordered_car.go_to_ordered_car_step("Step3")
#   raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
# end
#
# Then /^i am on the ordered car dashboard i should see Step 3$/ do
#   raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("2\nBuild week confirmed")
# end
#
# And /^i should see the text "Your build week is confirmed" with my car model details$/ do
#   raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your build week is confirmed")
# end
#
# And /^a step description with a link to setup alerts in Step 2 if not setup already$/ do
#   # step"a step description with a link to setup alerts in Step 1 if not setup already"
#   @ordered_car.logout
# end

# Step 4 Build in progress

When /^i have logged into an account with a user who has an ordered car which is on step 4$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.go_to_ordered_car_step("Step4")
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 4$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("4\nBuild in progress")
end

And /^i should see the text "Your Golf is being built" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your Golf is being built")
end

And /^a step description with a link to setup alerts in Step 4 if not setup already$/ do
  step"a step description with a link to setup alerts in Step 1 if not setup already"
end

# # Step 5 In transit

When /^i have logged into an account with a user who has an ordered car which is on step 5$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.go_to_ordered_car_step("Step5")
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 5$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("4\nIn transit")
end

And /^i should see the text "Your Golf is on its way" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your Golf is on its way")
end

And /^a step description with a link to setup alerts in Step 5 if not setup already$/ do
  step"a step description with a link to setup alerts in Step 1 if not setup already"
end

# Step 6 Arrived in the UK

When /^i have logged into an account with a user who has an ordered car which is on step 6$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.go_to_ordered_car_step("Step6")
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 6$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("6\nArrived in the UK")
end

And /^i should see the text "Your Golf has landed in the UK" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your Golf has landed in the UK")
end

And /^a step description with a link to setup alerts in Step 6 if not setup already$/ do
  step"a step description with a link to setup alerts in Step 1 if not setup already"
end

# Step 7a Nearly there

When /^i have logged into an account with a user who has an ordered car which is on step 7a$/ do
  @ordered_car = site.my_vw.ordered_car_dashboard
  @ordered_car.go_to_ordered_car_step("Step7a")
  raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
end

Then /^i am on the ordered car dashboard i should see Step 7a$/ do
  raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("7\nNearly there")
end

And /^i should see the text "Your Golf is nearly ready" with my car model details$/ do
  raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your Golf is nearly ready")
end

And /^details of the step below$/ do

end

# Step 7b Arrived at retailer
#
# When /^i have logged into an account with a user who has an ordered car which is on step 7b$/ do
#   @ordered_car = site.my_vw.ordered_car_dashboard
#   @ordered_car.go_to_ordered_car_step("Step7b")
#   raise AssertionError, "Ordered car dashboard not loaded" unless @ordered_car.ordered_dashboard_section
# end
#
# Then /^i am on the ordered car dashboard i should see Step 7b$/ do
#   raise AssertionError, "Step of my order is not correct" unless @ordered_car.current_step.eql?("7\nNearly there")
# end
#
# And /^i should see the text "Your Golf is with the retailer" with my car model details$/ do
#   raise AssertionError, "Status of my order is not correct" unless @ordered_car.title_text.eql?("Your Golf is with the retailer")
# end
#
# And /^details of the step below$/ do
# end