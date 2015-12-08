Given /^i test the response of the user api$/ do
  token = site.my_vw.my_vw_api.get_login_token(@account[0], @account[1])
  site.my_vw.my_vw_api.add_new_car(@account[2], token)
end
