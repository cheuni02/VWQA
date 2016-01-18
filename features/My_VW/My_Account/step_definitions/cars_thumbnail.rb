Given /^i have logged into my VW account with 25 different types of cars added$/ do
  @my_account = site.my_vw.my_account
  @my_account.visit
  @login = site.my_vw.login
  @login.login(@account[0],@account[1])
end

And /^i am on the My account page with 25 cars in car settings$/ do
  @my_account.my_account_page_present?
end

When /^i check particular car (.*) i want to see correct (.*) present$/ do |type, thumbnail|
  test = @my_account.get_car_type(type)
  model = @my_account.thumbnail_url(thumbnail)
  expect(test).to eq(model), "Thumbnail for car #{type} is not correct"
end

Given /^i have logged into my VW account with 8 different types of cars added$/ do
  @my_account1 = site.my_vw.my_account
  @my_account1.visit
  @login1 = site.my_vw.login
  @login1.login(@account[0],@account[1])
end

And /^i am on the My account page with 8 cars added$/ do
  @my_account1.my_account_page_present?
end

When /^i check car (.*) i want to see correct (.*) present$/ do |type, thumbnail|
  test = @my_account1.get_car_type(type)
  model = @my_account1.thumbnail_url(thumbnail)
  expect(test).to eq(model), "Thumbnail for car #{type} is not correct"
end
