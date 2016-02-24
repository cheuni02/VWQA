Given /^I have loaded the FOE page$/ do
  @foe = site.finance_offers.finance_options_explained
  @financeoffers = site.finance_offers.offers_page
  @foe.visit
end

Then /^I should see "(.*)" options$/ do |options|
  arr = @foe.get_options
  fail AssertionError, 'Unexpected number of options' unless arr.length == options.to_i
end

When /^I click on the tile that has a header link to (.*)$/ do |link|
  @text = link
  # puts @text
  @foe.click_link(link)
end

Then /^it will show the correct page$/ do
  fail AssertionError, 'Page loaded Incorrectly' unless @financeoffers.page_loaded?
  fail AssertionError, 'Page loaded Incorrectly' unless @financeoffers.get_title.downcase.include?(@text.downcase.to_s)
end
