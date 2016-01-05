Given /^i have logged into my VW account with max amount of current cars added$/ do
  @delete_car = site.my_vw.delete_car
  @add_car = site.my_vw.add_current_car
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  site.my_vw.login.login(@account[:username],@account[:password])
end

And /^i go to the add a car page$/ do
  @add_car.visit
end

# Popup alert

When /^i click on the button to add car I own$/ do
  @add_car.click_i_own_car_button
end

Then /^i should see pop up message about reaching max number of current cars added$/ do
  @add_car.max_car_alert_present?
end

And /^i can click on confirm alert to return back$/ do
  @add_car.max_alert_button_ok
  @add_car.step_1_present?
end

# Remove and add car

When /^i remove current car from my account$/ do
  @delete_car.my_cars_hover
  @delete_car.delete_current_car
  @delete_car.popup_alert_confirm
end

Then /^i can add current car successfully$/ do
  @add_car.visit
  @add_car.click_i_own_car_button
  @add_car.reg_input_present?
end

And /^no pop up alert appears$/ do
  raise AssertionError, "Pop up alert should not be displayed" unless @delete_car.popup_alert_present == false
  token = site.my_vw.my_vw_api.get_login_token(@account[0],@account[1])
  site.my_vw.my_vw_api.add_new_current_car(@account[2],token,"MyTestCar")
  site.refresh
end
