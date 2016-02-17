class FleetCompanyTaxCalc < FleetCalculators
  CAR_IMAGES = {
    up!: 'up',
    polo: 'polo',
    beetle: 'beetle'
  }

  def visit
    visit_page(page_url)
  end

  def select_car_model(model)
    car_models.each do |car|
      if car.link.text =~ /#{model}/i
        car.link.click
        break
      end
    end

    case model
    when /up/i
      car_image(CAR_IMAGES[:up!]).wait_until_present
    when /polo/i
      car_image(CAR_IMAGES[:polo]).wait_until_present
    when /beetle/i
      car_image(CAR_IMAGES[:beetle]).wait_until_present
    end
  end

  def select_trim(trim)
    car_trim_select.select(/#{trim}/i)
  end

  def select_engine(engine)
    car_trim_select_overlay.click
    car_engine_select.select(engine)
  end

  def tax_data_displayed?
    tax_table.present?
  end

  def get_tax_payable_values
    values = []
    tax_table.trs.each do |tr|
      values.push(tr.tds.last.text)
    end
    values
  end

  def set_tax_rate_40
    car_tax_40.set
  end

  def page_loaded?
    tax_table.present?
  end

  private

  def page_url
    '/fleet/company-tax'
  end

  def car_models
    @browser.ul(class: 'model-grid').lis
  end

  def car_trim_select
    @browser.select(id: 'trimId')
  end

  def car_trim_select_overlay
    @browser.div(id: 'uniform-derivativeId').span
  end

  def car_engine_select
    @browser.select(id: 'derivativeId')
  end

  def tax_table
    @browser.table(class: 'tax-bands')
  end

  def car_tax_40
    @browser.radio(name: 'taxBand', index: 1)
  end

  def car_image(source)
    @browser.img(src: /#{source}/i)
  end
end
