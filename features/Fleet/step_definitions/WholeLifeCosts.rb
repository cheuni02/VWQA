Given /^i am viewing the whole life costs page on the website$/ do
  @wholeLife = site.fleet.calculators.whole_life_calc
  @wholeLife.visit
end

When /^i select the car model (.*) from the horizontal list on the page$/ do |model|
  @wholeLife.select_car(model)
end

Then /^i should see a chart containing data representing the costs of that VW car over its lifespan$/ do
  fail unless @wholeLife.data_window_present?
end

And /^i should also note that the data has been updated in the last two months$/ do
  update = @wholeLife.get_data_update_date[0].split(/\s/)
  monthInt = Date::ABBR_MONTHNAMES.index(update[1].capitalize)
  currentMonthInt = Time.now.month

  fail if (monthInt > currentMonthInt) || (monthInt < (currentMonthInt - 1))
end

Given /^i am on the VW website homepage$/ do
  site.homepage.visit
end

When /^i click on the primary navigation link to Fleet$/ do
  site.primary_nav.click_fleet_link
end

And /^i click on the button to show calulators and tools$/ do
  site.fleet.click_calc_link
end

And /^i click on the panel to show the whole life costs for bluemotion cars$/ do
  site.fleet.calculators.click_whole_life
end

Then /^the whole life costs page should be loaded in my browser$/ do
  fail unless @wholeLife.page_loaded?
end
