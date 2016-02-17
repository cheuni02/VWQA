class NewCarConfigure < NewCars
  def page_loaded?
    config_models.present?
  end

  def show_first_info
    config_models.span(class: 'vw-icon-expand-small').click
  end

  def first_info_present?
    more_info_panel.present?
  end

  def visit
    visit_page(page_url)
  end

  def show_first_specification
    full_specification_open.click
  end

  def full_specification_present?
    more_info_panel.div(class: 'standard-specification').present?
  end

  def select_first_car
    first_item.click
  end

  private

  def config_models
    @browser.div(id: 'config-section')
  end

  def more_info_panel
    @browser.div(class: 'accordion')
  end

  def full_specification_open
    @browser.div(class: 'accordion').span(class: 'more-info')
  end

  def first_item
    @browser.button(css: "[data-doors='3']", index: 1)
  end

  def page_url
    '/new/up-nf/configure'
  end
end
