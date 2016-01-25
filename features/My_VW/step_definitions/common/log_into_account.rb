When (/^I login into my account$/) do
  site.my_vw.login.login_link.when_present.click
  site.my_vw.login.login(@account[:username], @account[:password])
  expect(site.my_vw.login.account_navigation_bar.present?).to be(true)
end