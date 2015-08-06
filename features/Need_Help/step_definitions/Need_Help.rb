Given /^i have come back to the VW Hompage$/ do
  site.homepage.visit
end

When /^i select the Need Help link in the top menu navigation$/ do
  site.primary_nav.click_need_help
end

Then /^i should be taken to the main FAQ Page on the site$/ do
  raise unless site.need_help.ask_question_present?
end

Given /^i have another query that i need help with$/ do
  site.need_help.visit
end

When /^i enter a search query of "(.*)" into the search for an answer box$/ do |query|
  site.need_help.set_query(query)
  site.need_help.search_query
end

Then /^i should see search results appear on the page with answers to my questions$/ do
  raise AssertionError, "No results present" unless site.need_help.query_results_present?
end

When /^i select the (.*) from the list of possible options$/ do |category|
  step "i have another query that i need help with"
  raise AssertionError, "option not present" if !site.need_help.click_category_link(category)
end
    
Then /^i should see a series of answers displayed on the page$/ do
  step "i should see search results appear on the page with answers to my questions"
end
