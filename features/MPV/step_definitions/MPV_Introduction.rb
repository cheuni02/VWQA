Given /^I have loaded the VW website$/ do
  @mpv = site.mpv
  @basics = @mpv.basics
  @models = @mpv.model_list
end

When /^I click on the link to take me to the MPV page$/ do
  @mpv.visit
end

Given /^I have loaded the MPV pages$/ do
  step "I have loaded the VW website"
  step "I click on the link to take me to the MPV page"
end

When /^I click on the start button to begin my personalised VW Journey$/ do
  @mpv.wait_to_start
  @mpv.click_start_button
end

Then /^I should be taken to the basics page$/ do
  raise PageNotLoadedError unless @basics.basics_page_loaded?
end

Given /^I have loaded the MPV page$/ do
  step "I have loaded the VW website"
  step "I click on the link to take me to the MPV page"
end

When /^I click on the I know what I want link$/ do
  @mpv.wait_to_start
  @mpv.click_i_know
end

Then /^I should be taken to the models page$/ do
  raise PageNotLoadedError unless @models.page_loaded?
end
