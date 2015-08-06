Given /^that I have opened the service promises page$/ do
  @service_promise = site.owners.servicing.service_promise
  @service_promise.visit
end

Then /^the page should be loaded successfully$/ do
  raise AssertionError, "Page not loaded" unless @service_promise.page_loaded?
end

When /^I click on link (.*)$/ do |link|
  @link = link
  @service_promise.click_link(link)
end

Then /^the (.*) should appear$/ do |promise|
  raise AssertionError, "Incorrect Promise" unless @service_promise.check_promise(promise, @link)
end