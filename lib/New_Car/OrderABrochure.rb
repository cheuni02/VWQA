class OrderABrochure < NewCars
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    car_models_grid.wait_until_present
    page_header.present?
  end

  def page_header
    page_header_locator
  end

  def page_description
    page_description_locator
  end

  def older_model_brochures_button
    older_model_brochures_locator
  end

  def car_models_grid
    car_models_grid_locator
  end

  def car_models
    car_models_locator
  end

  def car_model_name(car)
    car.label
  end

  def brochure_menu
    brochure_menu_locator
  end

  def brochure_menu_car_name
    brochure_menu_car_name_locator
  end

  def brochure_menu_downloads
    brochure_menu_downloads_locator
  end

  def brochure_menu_order_printed
    brochure_menu_order_printed_locator
  end

  def brochure_menu_view_car
    brochure_menu_view_car_locator
  end

  private

  def page_url
    '/order-a-brochure'
  end

  def page_header_locator
    @browser.h1(css: '#models>h1.headlineBlue')
  end

  def page_description_locator
    @browser.p(css: '.bookingDescription')
  end

  def older_model_brochures_locator
    @browser.link(css: "a[title='Older model brochures']")
  end

  def car_models_grid_locator
    @browser.ul(id: 'new-cars')
  end

  def car_models_locator
    @browser.lis(css: '#new-cars>li:not(.clear)')
  end

  def brochure_menu_locator
    @browser.div(class: 'selectedBrochureDownload show')
  end

  def brochure_menu_car_name_locator
    brochure_menu_locator.h4
  end

  def brochure_menu_downloads_locator
    brochure_menu_locator.links(css: '.download')
  end

  def brochure_menu_order_printed_locator
    brochure_menu_locator.link(css: ".bottom [data-brochuretype = 'order-a-brochure']")
  end

  def brochure_menu_view_car_locator
    brochure_menu_locator.link(css: '.viewCar a')
  end
end
