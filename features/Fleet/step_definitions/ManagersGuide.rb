Given(/^i am viewing the fleet managers guide page on the website$/) do
  @fleetManagers = site.fleet.managers_guide
  @fleetManagers.visit
end

Then(/^i should see all the major sections as navigation, title, description and list of guides$/) do
  fail 'Navigation is not displayed' unless @fleetManagers.managers_nav_present?
  fail 'Page title is not displayed' unless @fleetManagers.managers_header_present?
  fail 'Short description of the page is not displayed' unless @fleetManagers.managers_descr_section_present?
  fail 'The list of guides is not displayed' unless @fleetManagers.managers_guides_present?
end

When(/^i check the links to guides from navigation pane$/) do
  fail "Fleet Manager's Guide link not selected in navigation pane" unless @fleetManagers.managers_nav_selected?
  fail "Manager's guides list is not visible" unless @fleetManagers.managers_nav_guides_present?
end

Then(/^i should see "(.*)" links to guides in navigation pane$/) do |guides|
  act_guides = @fleetManagers.managers_nav_guides_links_no.to_s
  fail AssertionError, "Incorrect number of guides, expected: #{guides}, actual: #{act_guides}" unless @fleetManagers.managers_nav_guides_links_no.to_i == guides.to_i
end

When(/^i see the small description of fleet managers guide page is displayed$/) do
  fail "The description of Fleet Manager's guide page is missing" unless @fleetManagers.managers_description_present?
end

Then(/^i see the download button of the full managers guide$/) do
  fail 'The download button of the full guide is missing' unless @fleetManagers.managers_desc_down_btn_pres?
end

And(/^i see the share button of the fleet managers guide page$/) do
  fail 'The sharing button is missing from short description section' unless @fleetManagers.managers_desc_share_present?
end

When(/^i see that each link has a title and a more info button$/) do
  @fleetManagers.managers_guides_check_titles
  @fleetManagers.managers_guides_check_m_info
end

Then(/^i should see "(.*)" links to guides in the main fleet managers page$/) do |guides|
  act_guides = @fleetManagers.managers_guides_number.to_s
  fail AssertionError, "Incorrect number of guides, expected: #{guides}, actual: #{act_guides}" unless @fleetManagers.managers_guides_number.to_i == guides.to_i
end

When(/^i click on the (.*) managers guide link$/) do |guide|
  guide = guide.to_i
  guide -= 1
  fail "Guide #{guide + 1} is not displayed on the page" unless @fleetManagers.managers_guides_click_guide(guide)
end

Then(/^i should see the relevant content for (.*) managers guide$/) do |guide|
  fail "The guide #{guide} is not expanding" unless @fleetManagers.managers_guide_expanded_p?
  fail "The title of #{guide} guide is not displayed on the guide section" unless @fleetManagers.managers_guide_opened_title_p?
  fail "The Less info button of the guide #{guide} is not displayed" unless @fleetManagers.managers_guide_l_info_present?
  fail "The text of the guide #{guide} is not displayed" unless @fleetManagers.managers_guide_text_present?
  fail "The download button of the guide #{guide} is not displayed" unless @fleetManagers.managers_guide_download_p?
  fail "The share button of the guide #{guide} is not displayed" unless @fleetManagers.managers_guide_share_p?
  fail "The Back to top button is not displayed under guide #{guide}" unless @fleetManagers.managers_guide_to_top_present?
  fail "Cannot click on share button from guide #{guide}" unless @fleetManagers.managers_guide_click_share
  fail "Share options for guide #{guide} are not visible" unless @fleetManagers.managers_guide_share_section_p?
  fail "Cannot close share menu for guide #{guide}" unless @fleetManagers.managers_guide_click_share_close
end

But(/^i click on back to top and then on less info and the guide (.*) is closed$/) do |guide|
  fail unless @fleetManagers.managers_guide_click_to_top
  fail unless @fleetManagers.managers_guide_click_l_info
  fail "Guide #{guide} is still expanded" if @fleetManagers.managers_guide_text_present?
end
