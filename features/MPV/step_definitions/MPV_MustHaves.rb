Given /^that I have loaded the Must Haves Page$/ do
  @mpv = site.mpv
  @musthaves = @mpv.must_haves  
end

When /^the page is loaded$/ do
  @musthaves.visit_musthaves
  @musthaves.wait_for_summary
end
    
Then /^I should see "(.*)" questions and see cars button$/ do |questions|
  raise AssertionError, "Fail: Unexpected Number of Items" unless @musthaves.get_summary_items.length == questions.to_i
  raise ElementNotPresentError unless @musthaves.see_cars_button_present?
end

When /^the must haves page is loaded$/ do
  step "the page is loaded"
end
    
And /^I click the first question$/ do
  @musthaves.get_summary_items[0].a.click
end

Then /^the first page of the must haves section is shown$/ do
  @musthaves.get_question
  raise AssertionError, "First page of Must Haves not loaded" unless @musthaves.check_url(1)
end

Given /^that I have loaded page (.*)$/ do |pagenumber|
  step "that I have loaded the Must Haves Page"
  @oldquestion = @question
  @musthaves.visit_musthaves_yourdrive(pagenumber)
end

When /^the page has loaded$/ do  
  @question = @musthaves.get_question
  @musthaves.wait_for_new_question(@oldquestion, @question)  
end

Then /^the number of answers on the page must be (.*)$/ do |answers|
  items = @musthaves.get_question_items  
  raise AssertionError, "Fail: Unexpected Number of Items" unless items.length == answers.to_i
end
