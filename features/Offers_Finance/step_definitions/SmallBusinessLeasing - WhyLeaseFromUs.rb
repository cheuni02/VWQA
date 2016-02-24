Given /^I have loaded the Why Lease From Us page$/ do
  @whylease = site.finance_offers.why_lease
  @whylease.visit
end

Then /^the page should have loaded successfully$/ do
  @whylease.page_loaded?
end

When /^I click on (.*) tile on the lower section of the page$/ do |link|
  @whylease.click_link(link)
  case link
  when /Tax Calculator/i
    @page = site.fleet.calculators.company_car_tax_calc
  when /View our latest offers/i
    @page = site.finance_offers.small_business_leasing
  when /Contract hire finance calculator/i
    @page = site.finance_offers.finance_calculator
  when /Fleet 50 cars/i
    @page = site.fleet
  else fail
  end
end

Then /^it will direct you to the correct page$/ do
  fail AssertionError, 'Page not loaded' unless @page.page_loaded?
end

When /^I enter my local postcode as (.*) to the find specialist field$/ do |postcode|
  @whylease.set_postcode(postcode)
end

When /^I enter a name as (.*)$/ do |name|
  @whylease.set_name(name)
end

Then /^there (.*) be a search result displayed in my browser$/ do |postcode_result|
  if @whylease.search_retailer
    fail AssertionError, 'Incorrect search result' unless postcode_result == 'should'
  else
    fail AssertionError, 'Incorrect search result' unless postcode_result == 'should not'
  end
end

Then /^it comes back with a (.*) result$/ do |name_result|
  if @whylease.search_retailer
    fail AssertionError, 'Incorrect search with name' unless name_result == 'pass'
  else
    fail AssertionError, 'Incorrect search with name' unless name_result == 'fail'
  end
end
