When(/^I login into my account$/) do
  login = site.my_vw.login
  login.visit
  login.login(@account[:username], @account[:password])
end

Then(/^I will be logged into my account$/) do
  Watir::Wait.until { site.my_vw.login.logout.present? }
  expect(site.my_vw.login.account_navigation_bar.present?).to be(true)
end

When(/^I select the logout button$/) do
  site.my_vw.login.logout.when_present.click
end
