Given /^i am on the list of offers in the buying guide part of the website$/ do
  @offers = site.finance_offers.buying_guide
  @offers.visit
end

When /^i select the (.*) car model panel from the list on the page$/ do |model|
  @offers.select_car(model)
end

Then /^i should see a page with a list of the different offers any types appear in my browser$/ do
  fail unless @offers.offer_landing.page_loaded?
end

Given /^i am back on the VW Homepage$/ do
  site.homepage.visit
end

When /^i click on the navigation link to Offers and Finance$/ do
  site.primary_nav.click_offers_finance
end

And /^i click on the panel to link me to the offers listing page$/ do
  site.finance_offers.click_button_link('offers')
end

Then /^i should see the list of car models and offers load in my browser$/ do
  fail unless @offers.page_loaded?
end

When /^i click on the link to explain the different possible finance options$/ do
  site.finance_offers.buying_guide.click_finance_explain
end

Then /^i should be taken to a landing page with links to explaination pages$/ do
  fail unless site.finance_offers.finance_options_explained.page_loaded?
end

When /^i click on the button to show the finance calculator page$/ do
  @offers.click_finance_calculator
end

Then /^i should see the finance calculator page load in my browser window$/ do
  fail unless site.finance_offers.finance_calculator.model_grid_present?
end
