Before('@login') do
  @account = site.my_vw.login.get_account_details('General')
end

After('@login, @login_unvalid_user, @add_car_user, @login_Ordered_User, @login_current_car, @login_Current_User_Ext, @forgotten_password_user', '~@logout-force') do
  site.visit_page('/logout?postLogoutPage=/owners/my/account/index')
end

Before('@add_car_user') do
  @account = site.my_vw.login.get_account_details('General')
end

Before('@login_unvalid_user') do
  @account = site.my_vw.login.get_account_details('DBG_User_Invalid')
end

Before('@login_dbg_history_plan_without_car') do
  @account = site.my_vw.login.get_account_details('DBG_User_History_Plan')
end

Before('@login_dbg_plan_without_car') do
  @account = site.my_vw.login.get_account_details('DBG_User_Plan')
end

Before('@login_dbg_history_without_car') do
  @account = site.my_vw.login.get_account_details('DBG_User_History')
end

Before('@login_dbg_nothing_without_car') do
  @account = site.my_vw.login.get_account_details('DBG_User_Nothing')
end

Before('@login_current_car') do
  @account = site.my_vw.login.get_account_details('Current_car_User')
end

Before('@login_Ordered_User') do
  @account = site.my_vw.login.get_account_details('Ordered_Car_User')
end

Before('@login_Current_User') do
  @account = site.my_vw.login.get_account_details('Current_car_User')
end

Before('@login_Current_User_Ext') do
  @account = site.my_vw.login.get_account_details('Current_car_User_Ext')
end

Before('@login_complete_details_user') do
  @account = site.my_vw.login.get_account_details('All_details_complete_user')
end

Before('@login_single_car_user') do
  @account = site.my_vw.login.get_account_details('Single_current_car_user')
end

Before('@forgotten_password_user') do
  @account = site.my_vw.login.get_account_details('Forgotten_password_user')
end

After('@delete_password_token') do
  @account = site.my_vw.login.get_account_details('Forgotten_password_user')
  site.my_vw.forgotten_password.delete_user_reset_link(@account[:username])
end

After('@delete_added_car') do
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  site.my_vw.my_vw_api.remove_current_car(@account[:uuid], token, @car_id)
end

# Hook to force logout without clicking on the header link
After('@logout-force') do
  site.visit_page('/logout?postLogoutPage=/owners/my/account/index')
end

# Hook for Registering a Temporary Volkswagen.co.uk account
# USE THIS SPARINGLY! Will Spam the DB with test accounts if not carefully used!
# Should be used for tests such as account lockout to avoid locking out the
# general purpose account for other tests
Before('@Register_temp') do
  @account = site.my_vw.register.register_default_account
end

Before('@Register_temp_2') do
  @account = site.my_vw.register.register_default_account_new
end

After('@logout') do
  site.visit_page('/logout?postLogoutPage=/owners/my/account/index')
end
