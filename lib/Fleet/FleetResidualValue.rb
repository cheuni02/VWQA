class FleetResidualValue < FleetCalculators

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    car_grid.present?
  end

  def select_car(model)
    car_grid_models.each do |car|
      if car.link.text =~ /#{model}/i
        car.link.click
        sleep(3)
      end
    end
  end

  def data_window_present?
    data_windows.each do |window|
      return true if window.present?
    end
    return false
  end

  def get_update_date
    data_update.wait_until_present
    data_update.text.match(/\d\s\w+\s\d+/)
  end

  def nav_section_present?
    fleet_nav_section.present?
  end

  def car_grid_section_present?
    car_grid.present?
  end

  def data_section_present?
    data_windows_section.present?
  end
  private

  def page_url
    "/fleet/residual"
  end

  def car_grid
    @browser.ul(:class => 'model-grid')
  end

  def car_grid_models
    car_grid.lis
  end

  def data_windows
    @browser.divs(:class => "residual-value")
  end

  def data_update
    @browser.p(:class => "terms", :index => 0)
  end

  def fleet_nav_section
    @browser.div(:id => 'section-nav')
  end

  def data_windows_section
    @browser.div(:class => 'l-calculator-wrapper')
  end
end