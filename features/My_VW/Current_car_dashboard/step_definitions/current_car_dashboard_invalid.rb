Given /^that i have logged in to my VW account$/ do
  @current_car = site.my_vw.current_car_dashboard
  @current_car.visit
  @current_car.login_to_account
  @current_car.go_to_current_car_dash
end

When /^i am on the MY VW page$/ do

end

Then /^i should see a message saying that the registered owner of the car has changed$/ do

end
