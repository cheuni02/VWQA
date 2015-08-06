Given /^that I have loaded the gold SV SE details page$/ do
  @mpv = site.mpv
  @details = @mpv.details
end

When /^I have loaded the page$/ do
  @details.visit("1218")
  @details.wait_until_page_loaded
end

Then /^There should be "(.*)" options on the screen and a configurator link$/ do |options|
  raise AssertionError, "Unexpected number of options" unless @details.get_options.length == options.to_i
  raise ElementNotPresentError unless @details.configurator_link_present?
end