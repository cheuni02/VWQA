Given(/^I visit (.*) on the Volkswagen website$/) do |page_url|
  @grmtagf=site.gmt_finder
  @grmtagf.load_page page_url
end
When(/^I check for the existence of the GRM Tags in the header$/) do
  @script_list=@grmtagf.get_scripts_list
end
Then(/^I should find that the tags are present on the given page$/) do
  expect(@script_list).to include(@grmtagf.get_tag)
end