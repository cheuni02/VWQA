Given(/^I do not have an address associated with my account$/) do
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  site.my_vw.my_vw_api.update_user_details(@account[:uuid], token)
end

Given(/^my postcode is (.*)$/) do |postcode|
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  site.my_vw.my_vw_api.update_user_details(@account[:uuid], token, postcode: postcode)
end