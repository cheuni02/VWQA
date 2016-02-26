Given /^that I have loaded the VW website$/ do
  @configurator = site.new_cars.configurator
  @tracking = site.tracking
end

When /^I have navigated to the (.*) configurator page for (.*) and (.*)$/ do |model, trim, derivative|
  @configurator.visit_engine(model, trim, derivative)
  @source = @configurator.get_source
end

Then /^I should see conversion\.js being referenced in a script tag$/ do
  fail AssertionError, 'Tracking script not found = conversion.js' unless @tracking.find_conversion_script
end

And /^I should also see CDATA$/ do
  fail AssertionError, 'Tracking script not found = CDATA' unless @tracking.conversion_cdata? && !@tracking.valid_id?
end

And /^I should also see a tracking pixel for nonJS users$/ do
  fail AssertionError, 'Tracking script not correct - noscript' if @tracking.parse_con_noscript
end

When /^I have navigated to the (.*) config page for (.*) and (.*)$/ do |model, trim, derivative|
  step "I have navigated to the #{model} configurator page for #{trim} and #{derivative}"
end

And /^I should see an iframe generated via the tag$/ do
  fail AssertionError, 'Iframe not found' unless @tracking.iframe?
end

And /^it should contain the correct information$/ do
  @attributes = @tracking.get_iframe_hash
  fail AssertionError, "Value of #{@attributes['U11']} isn't false" unless @attributes['U11'] == 'false'
end

But /^when I click on the overview button$/ do
  @configurator.navigate_overview
end

Then /^the finished attribute, known as U11, should read "([^"]*)"$/ do |value|
  @attributes = @tracking.get_iframe_hash
  fail AssertionError, "Value of #{@attributes['U11']} isn't true" if @attributes['U11'] != value
end

When /^I have navigated to "(.*)" config page for "(.*)" and "(.*)"$/ do |model, trim, derivative|
  step "I have navigated to the #{model} configurator page for #{trim} and #{derivative}"
  @data = { model: model, trim: trim, derivative: derivative }
end

Then /^the iframe should contain the correct information$/ do
  step 'I should see an iframe generated via the tag'
  step 'it should contain the correct information'
  @attributes.each do |key, value|
    fail AssertionError, "Value of #{key} is empty" unless value != '' && !value.nil?
  end

  fail AssertionError, "Value of U1 (model) isn't correct" unless @attributes['U1'] == @data[:model]
  fail AssertionError, "Value of U2 (trim) isn't correct " unless @attributes['U2'] == @data[:trim]
  fail AssertionError, "Value of U3 (derivative) isn't correct" unless @attributes['U3'] == @data[:derivative]
end

And /^when I change the engine, paint, wheels, interior and extras$/ do
  @configurator.select_option(2)
  4.times do
    @configurator.navigate_next
    @configurator.select_last_option
    @configurator.select_first_conflict_res if @configurator.conflicts?
  end
  @configurator.navigate_overview
end

Then /^the iframe contents should change accordingly$/ do
  attributesNew = @tracking.get_iframe_hash
  unchanged = %w(U1 U2 U8 U9) # Fields that aren't going to change.
  @attributes.each do |key, value|
    fail AssertionError, "Value of #{key} hasn't changed" unless value != attributesNew[key] || unchanged.include?(key)
  end
end
