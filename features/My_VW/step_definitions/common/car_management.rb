When(/^I add a car with registration (.*) and display name (.*)$/) do |reg, name|
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  site.my_vw.my_vw_api.add_new_current_car(@account[:uuid], token,
                                           display_name: name,
                                           registration: reg)
end

When(/^I have ([0-9]*) cars in my account$/) do |num_cars|
  token = site.my_vw.my_vw_api.get_login_token(@account[:username], @account[:password])
  reg_nums = %w(LY65HRU LV65JHU RV64OYD AK15SVV LV65CLJ EY63XUK LR63FYB LT65UWR LP15OWW EA63KCX LP15OVN AV62EHW VA12EMK
                LR65AUF LT65NSV LT65XUN LM62UZY LD64YJE FP64UGT SX62BLV MT62WZY PX62XHJ YC13ZND BU63XBS SB63YSK)
  num_cars.to_i.times do |i|
    site.my_vw.my_vw_api.add_new_current_car(@account[:uuid], token,
                                             display_name: ([*('A'..'Z')]).sample(8).join,
                                             registration: reg_nums[i])
  end
end