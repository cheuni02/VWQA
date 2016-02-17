class FleetLifeValue < FleetCalculators
  def visit
    visit_page(page_url)
  end

  def select_car(model)
    car_grid_models.each do |car|
      if car.link.text =~ /#{model}/i
        car.link.click
        sleep(3)
      end
    end
  end

  def data_chart_present?
    data_chart.present?
  end

  def data_window_present?
    data_windows.each do |window|
      return true if window.present?
    end
    false
  end

  def get_data_update_date
    data_update_info.wait_until_present
    data_update_info.text.match(/\d\s\w+\s\d+/)
  end

  def page_loaded?
    car_grid.present?
  end

  private

  def page_url
    '/fleet/whole-life-costs'
  end

  def car_grid
    @browser.div(id: 'whole-life-costs-grid')
  end

  def car_grid_models
    car_grid.ul.lis
  end

  def data_chart
    @browser.div(class: 'pie-chart')
  end

  def data_windows
    @browser.divs(class: 'whole-life-cost')
  end

  def data_update_info
    @browser.p(class: 'terms', index: 0)
  end
end
