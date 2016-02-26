
Given /^i am on the Well worth it page$/ do
  @well_worth_it = site.about_us.well_worth_it
  @well_worth_it.visit
end

When /^i check the youtube video elements have loaded on the page$/ do
  @main_video_present = @well_worth_it.top_youtube_video.present?
end

Then /^i should find that the main video has loaded successfully$/ do
  fail ElementNotPresentError unless @main_video_present
end

And /^when i check for the smaller youtube videos close to the page footer$/ do
  @videos = {}
  @videos[:autoexpressguy1] = @well_worth_it.small_video_1.present?
  @videos[:autoexpressguy2] = @well_worth_it.small_video_2.present?
  @videos[:autoexpressguy3] = @well_worth_it.small_video_3.present?
end

Then /^i should also find that these videos have loaded successfully$/ do
  @videos.each do |key, video|
    fail ElementNotPresentError, "Video #{key} Could not be found!" unless video
  end
end

When /^i check if my image named (.*) has loaded on the page$/ do |image_name|
  @target_name = image_name
  # @images = @well_worth_it.get_all_images
end

Then /^i should find that the image is loaded and displayed in my browser window$/ do
  fail ElementNotPresentError, "Could not find image #{@target_name} Loaded on the page!" unless @well_worth_it.find_image(@target_name)
end

When /^i check the Volkswagen owners images for an image named (.*)$/ do |image_name|
  step "i check if my image named #{image_name} has loaded on the page"
end

Then /^i should find that the image is present and displayed inside the section$/ do
  step 'i should find that the image is loaded and displayed in my browser window'
end

When /^i check to see if the key buttons are on the page$/ do
  @key_buttons = {}
  @key_buttons[:button1] = @well_worth_it.find_perfect_model.present?
  @key_buttons[:button2] = @well_worth_it.book_a_test_drive.present?
  @key_buttons[:button3] = @well_worth_it.find_a_retailer.present?
end

Then /^i should find that the buttons are present on the page$/ do
  @key_buttons.each do |key, button|
    fail ElementNotPresentError, "Button #{key} could not be found" unless button
  end
end

When /^i check to see if the title is present on the page$/ do
  @main_title = @well_worth_it.title.present?
end

And /^the subheadings are present on the page$/ do
  @page_subheadings = @well_worth_it.subheadings
end

Then /^i should find that the title and subheadings are displayed on the page$/ do
  fail ElementNotPresentError unless @main_title && @page_subheadings
end
