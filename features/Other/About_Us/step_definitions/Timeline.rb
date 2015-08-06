Given /^that I have loaded the timeline$/ do
  @timeline = site.about_us.timeline
  @timeline.visit
end

When /^I have selected list mode$/ do
  @timeline.set_list_view
end

Then /^I should see the timeline in list mode$/ do
  raise AssertionError, "List not present on page" unless @timeline.get_list.length > 0
end

When /^I have selected timeline mode$/ do
  @timeline.set_timeline_view
end

Then /^I should see the timeline in timeline mode$/ do
  raise AssertionError, "Timeline not present on page" unless @timeline.timeline_present?
end

When /^I enter (.*) into the search box$/ do |search|
  @timeline.set_search_term(search)
  @timeline.start_search
end

And /^I set the decade to (.*)$/ do |decade|
  @timeline.set_decade(decade)
end

Then /^I should only see (.*) in the timeline$/ do |search|
  @timeline.set_list_view
  search_terms = search.split(' ')
  raise AssertionError, "Unable to find search terms in timeline" if @timeline.search_page(search_terms) == false
end

When /^I click on the (.*) button$/ do |decade|
  @timeline.set_list_view
  @timeline.set_decade(decade)
end

Then /^only articles from the (.*)s will be shown$/ do |decade|
  raise AssertionError, "Wrong dates shown in timeline" unless @timeline.check_dates(decade) == true
end
