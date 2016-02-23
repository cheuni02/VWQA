Given /^i am viewing fleet residual value page on the website$/ do
  @residualValue = site.fleet.calculators.residual_value
  @residualValue.visit
end

Given(/^i am visiting the VW website homepage$/) do
  site.homepage.visit
end

Then(/^i click on primary navigation link to Fleet page$/) do
  site.primary_nav.click_fleet_link
end

And(/^i click on the button to show calculators and tools page$/) do
  site.fleet.click_calc_link
end

And(/^i click on the panel to show the residual value$/) do
  site.fleet.calculators.click_residual_value
end

Then(/^the residual value page should be loaded in my browser$/) do
  fail unless @residualValue.page_loaded?
end

Then(/^i should see all the required sections on residual value page$/) do
  fail unless @residualValue.nav_section_present?
  fail unless @residualValue.car_grid_section_present?
  fail unless @residualValue.data_section_present?
end

When(/^i select car model (.*) from the horizontal list on the page$/) do |model|
  @residualValue.select_car(model)
end

Then(/^i should see a table containing comparison on residual values with other brands$/) do
  fail unless @residualValue.data_window_present?
end

And(/^i should see data that has been updated in the last two months$/) do
  update = @residualValue.get_update_date[0].split(/\s/)
  monthInt = Date::ABBR_MONTHNAMES.index(update[1].capitalize)
  currentMonthInt = Time.now.month

  fail if (monthInt > currentMonthInt) || (monthInt < (currentMonthInt - 1))
end
