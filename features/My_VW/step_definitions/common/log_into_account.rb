When(/^I login into my account$/) do
  login = site.my_vw.login
  login.visit
  login.login(@account[:username], @account[:password])
end

When(/^I login into my account with username: (.*) and password: (.*)$/) do |username, password|
  login = site.my_vw.login
  login.visit
  login.login(username, password)
end


Then(/^I will be logged into my account$/) do
  Timeout.timeout(30) { sleep 1 if site.my_vw.login.login_link.present? }
  expect(site.my_vw.login.account_navigation_bar.present?).to be(true)
end

When(/^I select the logout button$/) do
  site.my_vw.login.logout.when_present.click
end
