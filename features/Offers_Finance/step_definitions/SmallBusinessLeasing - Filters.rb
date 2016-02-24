Given /^i reset all the filters by going to the small business leasing mainpage$/ do
  @smallBusiness = site.finance_offers.small_business_leasing
  @smallBusiness.visit
end

Given /^i go back to the VW.co.uk homepage by clicking on the VW logo$/ do
  site.homepage.visit
end

When /^i click on the top level nav link to offers and finance$/ do
  site.primary_nav.click_offers_finance
end

And /^i click on the secondary nav link to the small business leasing page$/ do
  site.finance_offers.section_nav.click_link('Small Business Leasing')
end

Then /^i should see the small business page load in my browser window$/ do
  fail unless @smallBusiness.page_loaded?
end

Given /^i count the number of starting cars displayed in the filter box$/ do
  @start_cars = @smallBusiness.count_displayed_cars
end

When /^i remove the filter option (.*) from the list by clicking on it$/ do |filter|
  @smallBusiness.click_filter(filter)
  sleep(1) # Let Page Update itself
end

Then /^i should have (\d+) vehicle types left displayed on the page$/ do |expected_count|
  current_count = @smallBusiness.count_displayed_cars
  # STDOUT.puts current_count
  fail unless current_count.to_i == expected_count.to_i
end
