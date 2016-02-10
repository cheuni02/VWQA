When(/^I login into my account$/) do
  site.my_vw.login.login_link.when_present.click
  site.my_vw.login.login(@account[:username], @account[:password])
end

Then(/^I will be logged into my account$/) do
  Timeout.timeout(30) { sleep 1 if site.my_vw.login.login_link.present? }
  expect(site.my_vw.login.account_navigation_bar.present?).to be(true)
end
