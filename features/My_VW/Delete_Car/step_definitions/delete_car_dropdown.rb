
Given /^i have logged into my VW account with added current and ordered cars$/ do
  @delete_car = site.my_vw.delete_car
  @add_car = site.my_vw.add_current_car
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  site.my_vw.login.login(@account[0],@account[1])
end

And /^i go to the My cars$/ do
  @delete_car.my_cars_hover
end

# Delete current car

Given /^i have added a current car to my account$/ do
  token = site.my_vw.my_vw_api.get_login_token(@account[0],@account[1])
  site.my_vw.my_vw_api.add_new_current_car(@account[2],token,"MyTestCar")
  site.refresh
end

When /^i click delete icon to remove current car from my account$/ do
  @delete_car.delete_current_car
end

Then /^i need to confirm pop up alert to remove car$/ do
  @delete_car.popup_alert_confirm
end

And /^current car is removed from My cars$/ do
  @delete_car.my_cars_hover
  raise AssertionError, "Current car was not deleted" unless @delete_car.current_car_present == false
end

# Delete ordered car

Given /^i have added an ordered car to my account$/ do
  token = site.my_vw.my_vw_api.get_login_token(@account[0],@account[1])
  site.my_vw.my_vw_api.add_new_ordered_car(@account[2],token,"25274505")
  site.refresh
end

When /^i click delete icon to remove ordered car from my account$/ do
  @delete_car.delete_ordered_car
end

Then /^i need to confirm pop up alert to remove ordered car$/ do
  step 'i need to confirm pop up alert to remove car'
end

And /^ordered car is removed from My cars$/ do
  raise AssertionError, "Ordered car was not deleted" unless @delete_car.ordered_car_present == false
end
