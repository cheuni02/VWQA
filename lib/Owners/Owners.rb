class Owners < BrowserContainer

=begin "Not needed anyomore"

  def click_link(text)
    text_links.each do |li|
      if li.span(:text => /#{text}/i).present?
	li.link.click
	break
      end
    end
  end

=end

  def click_accessory_link
    accessory_link.click
  end

  def accessories
    Accessories.new(@browser)
  end

  def servicing
    ServiceBase.new(@browser)
  end

  def orders_status
    VwOrders.new(@browser)
  end

  def warning_lights
    WarningLights.new(@browser)
  end

  def owners_manuals
    OwnersManual.new(@browser)
  end

  def how_to_guides
    HowToGuides.new(@browser)
  end

  def breakdown_insurance
    BreakdownInsurance.new(@browser)
  end

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    wait_for_page
    carousel_wrapper.present?
    #text_links.first.present? #Text Based Links were removed
  end

  def wait_for_page
    carousel_main.wait_until_present
  end

  def find_order_number
    order_number_submit.when_present.click
  end

  private

  def page_url
    "/owners"
  end

  def text_links
    @browser.ul(:class => "task-statement").lis
  end

  def carousel_main
    @browser.div(:class => "vw-slideshow")
  end

  def carousel_wrapper
    @browser.div(:class => "owl-wrapper-outer")
  end

  def order_number_submit
    #@browser.button(:class => "vw-button-submit")
    @browser.image(:src => "/assets/content/owners/Owners-homepage/HP_module_track my order.jpg")
  end

  def accessory_link
    @browser.image(:src => "/assets/content/owners/Owners-homepage/HP_module_accessories.jpg")
  end


end
