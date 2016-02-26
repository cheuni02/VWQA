Given(/^the user is on the OSB first page$/) do
  site.homepage.visit

end

And(/^has selected (an RTC|a non RTC) retailer: (.*)$/) do |type, retailer|
  puts "type = #{type}"
  puts "retailer = #{retailer}"


end

Given(/^my car is on the affected cars list and i have entered the reg number on the stage 'Your Vehicle'$/) do
  #pending
end

When(/^I get to the “Select work” step on the OSB and select any service$/) do
  #pending
end

Then(/^the emissions fix work should be available \(only if engine size ia (\d+)\.(\d+), (\d+)\.(\d+) or (\d+)\.0\), and opened by default$/) do |arg1, arg2, arg3, arg4, arg5|
  #pending
end

And(/^it should be pre\-selected by default$/) do
  #pending
end

But(/^I should be able to deselect it$/) do
  #pending
end

And(/^I should be able to select any other additional work for my car$/) do
  #pending
end

Given(/^I have selected 'Emissions fix' at '3\. Select work'$/) do |arg|
  #pending
end

When(/^I get to the Convenience options at '4 Select date'$/) do |arg|
  #pending
end

Then(/^all the convenience options should be free of charge$/) do
  #pending
end

Given(/^I am on the "([^"]*)" page$/) do |arg|
  #pending
end

When(/^I have provided my car reg number$/) do
  #pending
end

Then(/^3rd party experian should return car details engine incl\. engine (.*)$/) do |size|
  #pending
end

When(/^I match the engine size from experian with the ones configured on RCMS$/) do
  #pending
end

Then(/^the work code shown in RCMS diary should be (.*)$/) do |job|
  #pending
end

And(/^the engine fix time shown in RCMS diary should be (.*)$/) do |time|
  #pending
end