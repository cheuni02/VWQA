Given /^the warning lights page is loaded$/ do
  @warninglights = site.owners.warning_lights
  @warninglights.visit
end

Then /^the warning lights page should be loaded correctly$/ do
  fail AssertionError, 'Page not loaded correctly' unless @warninglights.page_loaded?
end

When /^I click each of the (.*)$/ do |category|
  @colour = category
  @warninglights.click_colour(category)
end

Then /^only (.*) lights should be shown$/ do |lights|
  case (lights)
  when 'Red'
    fail AssertionError, 'Lights not shown' unless @warninglights.get_lights(lights)[0].present?
    fail AssertionError, "Yellow lights shouldn't be shown" if @warninglights.get_lights('Yellow')[0].present?
    fail AssertionError, "Green lights shouldn't be shown" if @warninglights.get_lights('Green')[0].present?
  when 'Yellow'
    fail AssertionError, "Yello lights shouldn't be shown" if @warninglights.get_lights('Red')[0].present?
    fail AssertionError, 'Lights not shown' unless @warninglights.get_lights(lights)[0].present?
    fail AssertionError, "Green lights shouldn't be shown" if @warninglights.get_lights('Green')[0].present?
  when 'Green'
    fail AssertionError, "Red lights shouldn't be shown" if @warninglights.get_lights('Red')[0].present?
    fail AssertionError, "Yellow Lights shouldn't be shown" if @warninglights.get_lights('Yellow')[0].present?
    fail AssertionError, 'Lights not shown' unless @warninglights.get_lights(lights)[0].present?
  else fail AssertionError, 'Page not loaded correctly' unless @warninglights.page_loaded?
  end
end

When /^I click on Brake system$/ do
  @title = 'Brake system'
  @warninglights.click_light(@warninglights.get_lights('Red')[0])
end

Then /^the title should be shown on the next page$/ do
  fail AssertionError, 'Title not shown correctly' unless @warninglights.get_title.include?('Brake system')
end
