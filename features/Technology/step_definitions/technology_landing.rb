Given(/^i visit the technology landing page by clicking on the top level navigation link$/) do
  @technologyLanding = site.technology
  @technologyLanding.visit
end

When(/^i land on the technology page$/) do
  raise unless @technologyLanding.page_loaded?
end


Then(/^i should be able to see the video$/) do
  @technologyLanding.video_present
end

When(/^i click on the link named (.*) from technology landing page$/) do |link|
  @technologyLanding.click_technology_navigation_link(link)
end

Then(/^i see the webpage opened having the following title (.*)$/) do |title|
  raise AssertionError,"Incorrect page title" unless @technologyLanding.get_browser_title == title
end

When(/^i see the additional technology sections on the page$/) do
  @technologyLanding.check_all_sections?
end

Then(/^i should see right content for each additional section$/) do
  @technologyLanding.check_content_in_all_sections?
end


When(/^i click on technology team thumbnail from technology landing page$/) do
  @technologyLanding.click_technology_contact
end

Then(/^i should be directed to technology team page$/) do
  raise AssertionError,"Incorrect page title" unless @technologyLanding.get_browser_title == "Contact us : Volkswagen UK"
end

When(/^i click on technology managers thumbnail on technology landing page$/) do
  @technologyLanding.click_technology_manager_guides
end

Then(/^i should be directed to a new tab with technology managers page displayed$/) do
  raise AssertionError, "Managers guide page is not opened" unless @technologyLanding.switch_to_manager_page
  raise AssertionError, "Incorrect page title" unless @technologyLanding.get_browser_title == "technology manager's guide : Volkswagen UK"
end