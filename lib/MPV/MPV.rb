class Mpv < BrowserContainer

  def visit
    visit_page_mpv(page_url)
  end

  def start_button_present?
  	start_button.present?
  end

  def wait_to_start
    start_button.wait_until_present
  end

  def see_cars_button_present?
    see_cars.present?
  end

  def i_know_link_present?
    i_know_what_i_want.present?
  end

  def page_loaded?
    section_head.wait_until_present
  end

  def click_start_button
    start_button.click
  end

  def click_see_cars_button
    see_cars.click
  end

  def click_i_know
    i_know_what_i_want.click
  end

  def default_basics
    #"?&transmission=any&body=any&color=any&price=any&performance=any&models=any"
    "?&transmission=any&body=any&color=any&price=any&performance=diesel&models=any"
  end

  def basics
    MPVBasics.new(@browser)
  end

  def must_haves
    MPVMustHaves.new(@browser)
  end

  def features
    MPVFeatures.new(@browser)
  end

  def shortlist
    MPVShortlist.new(@browser)
  end

  def details
    MPVDetails.new(@browser)
  end

  def model_list
    MPVModelList.new(@browser)
  end

  private

  def page_url
    "/perfect/app"
  end

  def start_button
    @browser.a(:class => "start")
  end

  def see_cars
    @browser.a(:class => "see\-cars")
  end

  def i_know_what_i_want
    @browser.a(:css => "a[href*='modelselect']")
  end

  def section_head
    @browser.div(:class => "intro\-copy").h1
  end
end
