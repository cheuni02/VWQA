class Well_worth_it < AboutUs

  def visit
    visit_page(page_url)
  end

  def top_youtube_video
    youtube_video
  end
  #Images
  def sound_proof_image
    sound_proof_cabin_image
  end

  def perfect_paint_image
    perfect_paint_finish_image
  end

  def laser_body_image
    laser_welded_image
  end

  def monsoon_image
    monsoon_testing_image
  end

  def steel_image
    steel_door_image
  end

  def review_images
    peoples_reviews_images
  end

  def find_perfect_model
    find_model_button
  end

  def book_a_test_drive
    book_test_drive_button
  end

  def find_a_retailer
    find_retailer_button
  end

  def small_video_1
    yt_container.wait_until_present
    small_youtube_video_1
  end

  def small_video_2
    yt_container.wait_until_present
    small_youtube_video_2
  end

  def small_video_3
    yt_container.wait_until_present
    small_youtube_video_3
  end

  def find_image(image_name)
    images = get_all_images
    #images.each {|image| image.src =~ /#{image_name}/i ? return image.present?}
    images.each do |image|
      if image.src =~ /#{image_name}/i
        return image.present?
      end
    end
    return false
  end

  def title
    title_on_page
  end

  def subheadings
    subheadings_on_page
  end



  private

  def page_url
    "/about-us/well-worth-it"
  end

  def youtube_video
    @browser.iframe(:src => "//www.youtube.com/embed/videoseries?list=PLDFOuBfiH4xjV-bBpmbFeLGz4LHT6ltlU&wmode=transparent")
  end

  def small_youtube_video_1
    #STDOUT.puts @browser.div(:id => "valueHub-slideshow").present?
    #STDOUT.puts @browser.div(:id => "valueHub-slideshow").iframe(:src => /www\.youtube\.com/i).present?
    @browser.div(:id => "valueHub-slideshow").iframe(:src => /www\.youtube\.com/i, :index => 0)
  end

  def small_youtube_video_2
    @browser.div(:id => "valueHub-slideshow").iframe(:src => /www\.youtube\.com/i, :index => 1)
  end

  def small_youtube_video_3
    @browser.div(:id => "valueHub-slideshow").iframe(:src => /www\.youtube\.com/i, :index => 2)
  end

  def yt_container
    @browser.div(:id => "valueHub-slideshow")
  end

  def get_all_images
    @browser.images
  end

  def peoples_reviews_images
    @browser.p(:class => "ownerImages").images
  end

  def find_model_button
    @browser.li(:class => "vw-button").link(:href => "/new/range")
  end

  def book_test_drive_button
    @browser.link(:href => "/book-a-test-drive")
  end

  def find_retailer_button
    @browser.link(:href => "/find-a-retailer")
  end

  def title_on_page
    @browser.h1(:class => "heading-main")
  end

  def subheadings_on_page
    @browser.divs(:class => "title orange").each do |div|
      div.present?
    end
  end
end
