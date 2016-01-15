Before('@login') do
  @account = site.my_vw.login.get_login_details('General')
end

After('@login, @login_unvalid_user, @add_car_user, @login_Ordered_User, @login_current_car, @login_Current_User_Ext', '~@logout-force') do
  site.visit_page('/logout?postLogoutPage=/owners/my/account/index')
end

Before('@add_car_user') do
  @account = site.my_vw.login.get_account_details('General')
end

Before('@login_unvalid_user') do
  @account = site.my_vw.login.get_login_details('DBG_User_Invalid')
end

Before('@login_current_car') do
  @account = site.my_vw.login.get_login_details('Current_car_User')
end

Before('@login_Ordered_User') do
  @account = site.my_vw.login.get_login_details('Ordered_Car_User')
end

Before('@login_Current_User') do
  @account = site.my_vw.login.get_login_details('Current_car_User')
end

Before('@login_Current_User_Ext') do
  @account = site.my_vw.login.get_login_details('Current_car_User_Ext')
end

Before('@login_complete_details_user') do
  @account = site.my_vw.login.get_account_details('All_details_complete_user')
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

After ('@logout') do
  site.visit_page('/logout?postLogoutPage=/owners/my/account/index')
  #site.owners.wait_for_page
end
