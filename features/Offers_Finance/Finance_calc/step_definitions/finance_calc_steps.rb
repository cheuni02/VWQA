Given /^i navigate to the list of all available finance calculator models$/ do
  @finance_calc = site.finance_offers.finance_calc_new
  @finance_calc.visit
end

When /^user clicks on model from the displayed grid$/ do
  @finance_calc.click_car_model('up!')
end

Then /^user should be navigated to the models finance calculator page$/ do
  @finance_calc.wait_for_calc_page
  fail PageNotLoadedError unless @finance_calc.finance_table_present?
end

When /^user selects (.*) trim$/ do |trim_name|
  @finance_calc = site.finance_offers.finance_calc_new
  @finance_calc.change_trim(trim_name)
end

Then /^trims finance page should show (.*) derivative above table$/ do |trim_name|
  check = @finance_calc.check_trim_derivative(trim_name)
  fail AssertionError, "#{trim_name}:not seen above finance table" if check.match(/#{trim_name}/).nil?
end

When /^user changes the value of the deposit to be "(.*)" and presses update$/ do |depositValue|
  @finance_calc = site.finance_offers.finance_calc_new
  @finance_calc.set_deposit(depositValue)
end

Then /^the deposit value is reflected on the table is "(.*)"$/ do |depositValueCheck|
  check = @finance_calc.check_deposit_in_table(depositValueCheck)
  fail AssertionError, " #{depositValueCheck}: not seen on finance table" unless check == depositValueCheck
end

When /^user clicks on (.*) under my repayment time$/ do |month|
  @finance_calc = site.finance_offers.finance_calc_new
  @finance_calc.click_month(month)
end

Then /^the duration field within the table should show month (.*)$/ do |month|
  durationMatch = @finance_calc.check_month_in_table(month)
  fail AssertionError, "#{month}: selected but not seen on the table" if durationMatch.nil?
end

When /^user clicks on (.*) under average car mileage$/ do |mileage|
  @finance_calc = site.finance_offers.finance_calc_new
  @finance_calc.click_mileage(mileage)
end

Then /^the average miles per year field within the table should show mileage (.*)$/ do |mileage|
  copyToCheckMod = @finance_calc.check_mileage(mileage)
  fail AssertionError, "#{mileage}: selected but not seen on the table" unless mileage == copyToCheckMod
end
