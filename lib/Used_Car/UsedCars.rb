class UsedCars < BrowserContainer
  def page_loaded?
    page_header.text =~ /used cars/i
  end

  def visit
    visit_page(page_url)
  end

  def image_youtube_thumbnails(thumbnail)
    images_t = youtube_thumbnail_images
    images_t.each do |thumbnail_s|
      return images_t.present? if thumbnail_s.src =~ /#{thumbnail}/i
      return false
    end
  end

  def checks_url_video
    checks_video
  end

  def quibble_url_video
    quibble_video
  end

  def ulimited_mileage_url_video
    u_mileage_video
  end

  def das_benefits_b
    das_welt_auto_button
  end

  def benefit_sections
    das_weltauto_benefit_s
  end

  def road_assistance_page_link
    road_assistance_offer_link
  end

  def seven_day_insurance_link
    seven_d_volkswagen_insurance_link
  end

  def finance_options_explained_link
    buying_guide_finance_explained
  end

  def finance_solutions_link
    solutions_link
  end

  def images_for_benefit_section(benefit)
    images_b = all_benefits_images
    images_b.each do |orange_images|
      return images_b.present? if orange_images.src =~ /#{benefit}/i
      return false
    end
  end

  def used_cars_link
    search_used_cars_url
  end

  private

  def page_url
    '/used'
  end

  def page_header
    @browser.li(class: 'title current')
    # @browser.div(:class => "used-cars-header")
  end

  def youtube_thumbnail_images
    # @browser.images
    @browser.image(src: '/assets/common/content/used/img-youtube-thumb.jpg')
    @browser.image(src: '/assets/common/content/used/img-youtube-thumb-2.jpg')
    @browser.image(src: '/assets/common/content/used/no-quibbles.jpg')
  end

  def checks_video
    @browser.iframe(src: 'http://www.youtube.com/embed/S-sgAo8Vtag')
  end

  def quibble_video
    @browser.iframe(src: 'http://www.youtube.com/embed/hJVqCilYd0w')
  end

  def u_mileage_video
    @browser.iframe(src: 'http://www.youtube.com/embed/upxK9knsPZw')
  end

  def das_welt_auto_button
    @browser.li(class: 'vw-btn grid-2', index: 1).link(href: '/used/our-programme')
  end

  def das_weltauto_benefit_s
    @browser.divs(class: 'title orange').each(&:present?)
  end

  def road_assistance_offer_link
    @browser.div(id: 'used-cars-container').link(href: '/owners/assistance')
  end

  def seven_d_volkswagen_insurance_link
    @browser.div(id: 'used-cars-container').link(href: '/used/used-car-insurance')
  end

  def buying_guide_finance_explained
    @browser.div(id: 'used-cars-container').link(href: '/buying-guide/finance-options-explained')
  end

  def solutions_link
    @browser.div(id: 'used-cars-container').link(href: '/buying-guide/solutions')
  end

  def all_benefits_images
    @browser.image(src: '/assets/common/content/used/img-12.png')
    @browser.image(src: '/assets/common/content/used/img-info.png')
    @browser.image(src: '/assets/common/content/used/img-excl-mark.png')
    @browser.image(src: '/assets/common/content/used/img-7.png')
    @browser.image(src: '/assets/common/content/used/img-money.png')
  end
end

def search_used_cars_url
  @browser.li(class: 'vw-btn grid-2', index: 0).link(href: 'http://usedcars.volkswagen.co.uk/')
end
