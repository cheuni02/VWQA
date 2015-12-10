
  Given /^i am on the used cars page$/ do
    @used_cars_page = site.used_cars
    @used_cars_page.visit
  end

  When /^i check that the (.*) is present on the page$/ do |thumbnail|
    @thumbnails_present = thumbnail
  end

  Then /^I should find that the images have loaded properly$/  do
    raise ElementNotPresentError unless @thumbnails_present
  end

  When /^i check to see if the youtube videos exist on the page$/ do
    @youtube_used_videos = Hash.new
    @youtube_used_videos[:usedvideo1] = @used_cars_page.checks_url_video.present?
    @youtube_used_videos[:usedvideo2] = @used_cars_page.quibble_url_video.present?
    @youtube_used_videos[:usedvideo3] = @used_cars_page.ulimited_mileage_url_video.present?
  end

  Then /^i should see that the youtube videos are present on the page$/ do
    @youtube_used_videos.each do |key, video|
    raise ElementNotPresentError, "Video #{@youtube_used_videos} not found!" unless @youtube_used_videos
    end
  end

  When /^i click on the Das WeltAuto benefits button$/ do
    @used_cars_page.das_benefits_b.span.when_present.click
  end

  Then /^the benefits sections should have loaded on the page sucessfully$/ do
    @all_links_in_section = [
      @used_cars_page.road_assistance_page_link,
      @used_cars_page.seven_day_insurance_link,
      @used_cars_page.finance_options_explained_link,
      @used_cars_page.finance_solutions_link
    ]
    raise ElementNotPresentError unless @used_cars_page.benefit_sections
    @all_links_in_section.each do |item|
      raise ElementNotPresentError, "#{item} not present" unless item.present?
    end
  end

  When /^i click on the Das Wel button to load the benefits section$/ do
    step "i click on the Das WeltAuto benefits button"
  end

  Then /^the (.*) image should load$/ do |benefit|
    @images_for_benefits_present = benefit
    raise ElementNotPresentError unless @images_for_benefits_present
  end

  When /^I check if the Search used cars link is present on the page$/ do
    @used_cars_button = @used_cars_page.used_cars_link.present?
  end

  Then /^i should see that the link is successfully on the page$/ do
    raise ElementNotPresentError unless @used_cars_button
  end
