Given /^i have come back to the VW Homepage$/ do
  site.homepage.visit
end

When /^i click on the login and register link at the top of my browser$/ do
  site.primary_nav.click_login
end

Then /^i should be shown a page containing the login and signup forms$/ do
  site.my_vw.login.page_loaded?
end

When /^i enter my email into the email field on the page$/ do
  # sleep(3)
  site.primary_nav.click_login
  # sleep(3)
  site.my_vw.login.set_email(@account[:username])
end

And /^i enter my password into the password box$/ do
  site.my_vw.login.set_password(@account[:password])
end

And /^i try to log into my account$/ do
  site.my_vw.login.do_login
end

Then /^i should see the main page of my profile load in my browser$/ do
  fail unless site.my_vw.profile.page_loaded?
end

Given /^i am logged in to my VW Account$/ do
  step 'i enter my email into the email field on the page'
  step 'i enter my password into the password box'
  step 'i try to log into my account'
end

When /^i click on the link to log out of my account$/ do
  site.my_vw.primary_nav.click_logout
end

Then /^i should be returned to the owners homepage$/ do
  fail unless site.owners.page_loaded?
end
