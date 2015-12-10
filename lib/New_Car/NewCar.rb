class NewCars < BrowserContainer
  include CommonNav

  def select_model(model_name)
    car_range.lis.each do |li|
      if li.span.h2.text =~ /#{model_name}/i
	li.link.when_present.click
	break
      end
    end
  end

  def confirm_model
    confirm_car_button.when_present(15).click
  end

  def configurator
    @configurator = Configurator.new(@browser)
  end

  def configure_page
    @configure_page = NewCarConfigure.new(@browser)
  end

  def mlp_nav
    CommonNav::NewCarNav.new(@browser)
  end

  def primary_nav
    CommonNav::PrimaryNav.new(@browser)
  end

  def car_models
    CarModelsPage.new(@browser)
  end

  def explore_page
    ExplorePage.new(@browser)
  end

  def keep_informed
    KeepMeInformed.new(@browser)
  end

  def engines_performance
    EnginesAndPerformance.new(@browser)
  end

  def order_printed_brochure
    OrderPrintedBrochure.new(@browser)
  end

  def order_a_brochure
    OrderABrochure.new(@browser)
  end

  def click_keep_informed_link
    keep_informed_link.when_present.click
  end

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    horizontal_view_button.present?
  end

  def set_horizontal_view
    horizontal_view_button.click
  end

  def go_to_end_button_present?
    horizontal_go_to_end.present?
  end

  def set_car_order(option)
    car_order_select.li(:text => "#{option}").link.click
  end

  def get_first_model_name
    car_range.lis.first.span.h2.text
  end

  def car_detail_panel_present?
    car_info_area.wait_until_present(15)
  end

  def car_price_info_present?
    price_info.present?
  end

  def car_size_info_present?
    size_info.present?
  end

  def car_performance_info_present?
    performance_info.present?
  end

  def car_efficiency_info_present?
    efficiency_info.present?
  end

  def mlp_loaded?
    mlp_image.present?
  end

  def click_mlp_offer
    mlp_offer_panel.when_present.click
  end

  def mlp_offer_present
    mlp_offer_panel.present?
  end

  def wait_for_mlp_load
    mlp_image.wait_until_present
  end

  def wait_for_range_load
    car_range.wait_until_present
  end

  private

  def car_range
    @browser.div(:id => "model-range").ul
  end

  def confirm_car_button
    @browser.link(:class => "to-mlp")
  end

  def page_url
    "/new/range"
  end

  def keep_informed_link
    @browser.div(:id => "footer-links").link(:index => 0)
  end

  def car_order_select
    #@browser.div(:id => "uniform-range-filter").select(:id => "range-filter")
    @browser.div(:id => "range-filter-container").ul(:class => "clearfix")
  end

  def horizontal_view_button
    @browser.button(:class => "view-switcher-film-strip")
  end

  def horizontal_go_to_end
    @browser.button(:id => "go-to-end")
  end

  def car_info_area
    @browser.div(:id => "information-area")
  end

  def price_info
    car_info_area.p(:class => "price")
  end

  def size_info
    car_info_area.li(:class => "size")
  end

  def performance_info
    car_info_area.li(:class => "performance")
  end

  def efficiency_info
    car_info_area.li(:class => "efficiency")
  end

  def mlp_image
    @browser.image(:src => "/static/images/mlps/hero-carousel/hero-carousel-bg.png")
  end

  def mlp_offer_panel
    @browser.div(:id => "page-bg").div(:class => "copy-wrap").link(:class => "mlp-cta")
  end
end
