Given /^i visit the VW Homepage on the website$/ do
  site.homepage.visit
end

When /^i click the link to Offers & Finance$/ do
  site.primary_nav.click_offers_finance
end

Then /^i should see the buying guide page load in my browser$/ do
  fail ValidationException, 'Error' unless site.finance_offers.offers_page_loaded?
end

Given /^i am currently on the offers and Finance homepage$/ do
  site.finance_offers.visit
end

When /^i click the page link to the (.*) section of the VW Site$/ do |page|
  site.finance_offers.click_button_link(page)
end

Then /^i should see the Volkswagen offers page load in my browser$/ do
  fail unless site.finance_offers.buying_guide.page_loaded?
end

When /^i click the page link to view VW (.*) offers$/ do |page|
  step 'i am currently on the offers and Finance homepage'
  site.finance_offers.click_button_link(page)
end

Then /^i should see a information page with a header "(.*)"$/ do |header|
  fail unless site.standard_content_page.get_header_text =~ /#{header}/i
end

And /^there should be an image and text information on the page$/ do
  fail unless site.standard_content_page.image_loaded?
end

Given /^i go back to the Buying Guide landing page$/ do
  step 'i am currently on the offers and Finance homepage'
end

When /^i click the page link to show information about VW (.*) options$/ do |page|
  site.finance_offers.click_button_link(page)
end

Then /^i should see an information page containing details about insurance options$/ do
  step 'there should be an image and text information on the page'
end

And /^i should see (\d+) other buttons pointing to other pages on the site$/ do |count|
  fail unless site.standard_content_page.count_button_links == count.to_i
end

Given /^i return to the buying guide main page to select another option$/ do
  step 'i am currently on the offers and Finance homepage'
end

When /^i click the page link to show information about (.*) of VW Products$/ do |page|
  site.finance_offers.click_button_link(page)
end

Then /^i should see an information page with a header "(.*)"$/ do |header|
  fail unless site.standard_content_page.get_header_text =~ /#{header}/i
end

And /^there should be an image and (\d+) other button link displayed on the page$/ do |links|
  fail unless site.standard_content_page.image_loaded? && site.standard_content_page.count_button_links == links.to_i
end

Given /^i return to the buying guide landing page to view more buying options$/ do
  step 'i am currently on the offers and Finance homepage'
end

When /^i click on the link to view the finance calculator$/ do
  site.finance_offers.click_finance_calc_button
end

Then /^the page to select which model i want should load in my browser$/ do
  fail unless site.finance_offers.finance_calculator.model_grid_present?
end
