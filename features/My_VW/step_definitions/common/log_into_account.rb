When (/^I login into my account$/) do
  site.my_vw.login.login_link.when_present.click
  site.my_vw.login.login(@account[:username], @account[:password])
  add_car = site.my_vw.login
  Timeout.timeout(3) { sleep 1 unless add_car.account_navigation_bar.present? }
  expect(add_car.account_navigation_bar.present?).to be(true)
end