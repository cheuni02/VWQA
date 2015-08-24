
# Delete account and log in using the same credentials

Given /^i am logged in$/ do
  site.primary_nav.click_login
  site.my_vw.login.page_loaded?
  site.my_vw.login.set_email(@account[0])
  site.my_vw.login.set_password(@account[1])
  site.my_vw.login.do_login
  site.my_vw.login.login_active?
end

And /^i click on the link to Update profile$/ do
  site.my_vw.login.my_profile_edit
end

When /^i delete my profile$/ do
  site.my_vw.login.delete_account_click
end

Then /^i should not be able to login with my credentials again$/ do
  site.my_vw.login.set_email(@account[0])
  site.my_vw.login.set_password(@account[1])
  site.my_vw.login.do_login
  site.my_vw.register.form_error_present?
end

