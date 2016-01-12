Given /^i have logged into my VW account with different types of cars added$/ do
  @my_account = site.my_vw.my_account
  @my_account.visit
  site.my_vw.login.login(@account[0],@account[1])
end

And /^i am on the My account page$/ do
  @my_account.my_account_page_present?
end

When /^i check particular car (.*) i want to see correct (.*) present$/ do |type, thumbnail|
  test = @my_account.get_car_type(type)
  model =@my_account.thumbnail_url(thumbnail)
  expect(test).to eq(model), "Thumbnail for car #{type} is not correct"
end
