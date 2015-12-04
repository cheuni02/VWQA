
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
