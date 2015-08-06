Given(/^i visit the fleet landing page by clicking on the top level navigation link$/) do
  @technologyLanding = site.fleet
  @technologyLanding.visit
end

When(/^i land on the fleet page the slideshow should be visible$/) do
  raise unless @technologyLanding.fleet_carousel_present?
end


Then(/^i should be able to navigate through slides$/) do
  @technologyLanding.click_fleet_carousel_next_btn
  @technologyLanding.click_fleet_carousel_prev_btn
end

When(/^i click on the link named (.*) from fleet landing page$/) do |link|
  @technologyLanding.click_fleet_navigation_link(link)
end

Then(/^i see the page opened having the following title (.*)$/) do |title|
  raise AssertionError,"Incorrect page title" unless @technologyLanding.get_browser_title == title
end

When(/^i see the additional fleet sections on the page$/) do
  raise unless @technologyLanding.fleet_team_present?
  raise unless @technologyLanding.fleet_newsletter_present?
  raise unless @technologyLanding.fleet_manager_guides_preset?
  raise unless @technologyLanding.fleet_tax_guide_present?
  raise unless @technologyLanding.fleet_emissions_guide_present?
end

Then(/^i should see the correct content for each additional section$/) do
  @technologyLanding.fleet_team_content_present?
  @technologyLanding.fleet_news_content_present?
  @technologyLanding.fleet_manager_present?
  @technologyLanding.fleet_tax_guides_present?
  @technologyLanding.fleet_emissions_present?
end


 When(/^i click on fleet team thumbnail from fleet landing page$/) do
  @technologyLanding.click_fleet_contact
end

Then(/^i should be directed to fleet team page$/) do
  raise AssertionError,"Incorrect page title" unless @technologyLanding.get_browser_title == "Contact us : Volkswagen UK"
end

When(/^i click on fleet managers thumbnail on fleet landing page$/) do
  @technologyLanding.click_fleet_manager_guides
end

Then(/^i should be directed to a new tab with fleet managers page displayed$/) do
  raise AssertionError, "Managers guide page is not opened" unless @technologyLanding.switch_to_manager_page
  raise AssertionError, "Incorrect page title" unless @technologyLanding.get_browser_title == "Fleet manager's guide : Volkswagen UK"
end