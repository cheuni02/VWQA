Given /^i have completed Step 1$/ do

end

And /^click the next My details button$/ do

end

When /^i am on Step 2$/ do

end

Then /^i should see my personal details and address cards already populated$/ do

end

Given /^i am not logged in to an account$/ do

end

When /^i click the book a service button$/ do

end

And /^i complete Step 1$/ do

end

Then /^i should be able to see Step 2 where i can fill in my personal details$/ do

end

When /^i click the edit link on the personal details card$/ do

end

And /^i fill in the my (.*), (.*), (.*) and (.*)$/ do |first_name, last_name, mobile, email|

end

Then /^i should get a (.*) message if any details are not valid$/ do |message|

end
