Given /^that I have loaded the features section$/ do
  @mpv = site.mpv
  @features = @mpv.features
end

When /^I load the features section$/ do
  @features.visit_summary
  @features.wait_for_page_load_summary
end

Then /^there should be questions and the see cars button$/ do
  raise AssertionError, "Fail: Unexpected Number of Items" unless @features.questions_container_present?
  raise ElementNotPresentError unless @features.see_cars_button_present?
end

When /^I have entered each of the questions$/ do
  step "I load the features section"
end
    
Then /^the number of options should be "(.*)"$/ do |options|  
  arr = @features.get_questions
  arr.each_with_index do |item,index|
    if(index==0)
      @features.open_question(item)
    end
    sleep(1)
    answers = @features.get_answers(index)
    raise AssertionError, "Fail: Unexpected Number of Options" unless answers.length == options.to_i
    unless index == arr.length-1
      @features.next_item
    end
  end
end