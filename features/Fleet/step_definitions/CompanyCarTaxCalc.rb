Given /^i am on the company car tax calculator page$/ do
  @taxCalculator = site.fleet.calculators.company_car_tax_calc
  @taxCalculator.visit
end

When /^i select the (.*) as the model of car i want to view information for$/ do |model|
  @taxCalculator.select_car_model(model)
end

And /^i select a trim (.*) and engine style (.*)$/ do |trim, engine|
  sleep(2)
  @taxCalculator.select_trim(trim)
  @taxCalculator.select_engine(engine)
end

Then /^i should see a table appear showing various tax data values$/ do
  fail unless @taxCalculator.tax_data_displayed?
end

But /^if i change the tax band to 40\% from 20\%$/ do
  @oldValues = @taxCalculator.get_tax_payable_values
  @taxCalculator.set_tax_rate_40
  sleep(2)
end

Then /^i should see the monthly tax values in the table update$/ do
  newValues = @taxCalculator.get_tax_payable_values
  fail unless (@oldValues - newValues).length != 0
end

Given /^i am back on the VW homepage as a new user$/ do
  site.homepage.visit
end

When /^i click on the primary navigation link to the fleet section$/ do
  site.primary_nav.click_fleet_link
end

And /^i click on the button to view all valid calculators$/ do
  site.fleet.click_calc_link
end

And /^i select the P11D And company car tax calculator option$/ do
  site.fleet.calculators.click_company_car_tax
end

Then /^i should see the company car tax calculator page has appeared in my browser$/ do
  fail unless @taxCalculator.page_loaded?
end
