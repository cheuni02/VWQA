class Configurator < NewCars
  def loaded?
    main_panel.present?
  end

  def visit_complete_config(model = 'up-nf', trim = '1566', derivative = '1573')
    visit_page(complete_config(model, trim, derivative))
  end

  def visit_engine(model = 'up-nf', trim = '1566', derivative = '1573')
    visit_page(engine(model, trim, derivative))
  end

  def overview_click_shortcode
    overview_shortcode.parent.click
  end

  def shortcode_url_present?
    shortcode_url_field.wait_until_present(15)
  end

  def get_shortcode_url
    shortcode_url_field.when_present.value
  end

  def visit_shortcode(shortcode)
    code = shortcode.match(/\/[a-zA-Z0-9]+\/[a-zA-Z0-9]+\z/i)
    visit_page(code[0])
  end

  def overview_car_name
    overview_car_header.when_present.text
  end

  def click_overview_test_drive
    overview_book_test_drive.when_present.click
  end

  def overview_save_configuration
    overview_save_button.click
  end

  def set_save_configuration_name(name)
    save_configuration_field.when_present.set(name)
  end

  def save_configuration
    save_configuration_button.when_present.click
  end

  def click_overview_finance_calculator
    overview_finance_calculator.when_present.click
  end

  def select_last_option
    options.last.a.click
  end

  def select_option(option)
    options[option - 1].a.click
  end

  def navigate_overview
    overview_section.click
  end

  def navigate_next
    next_button.click
  end

  def conflicts?
    conflict_container.present?
  end

  def select_first_conflict_res
    conflict_options.first.button.when_present.click
  end

  private

  def main_panel
    @browser.div(id: 'config-image')
  end

  def complete_config(model, trim, derivative)
    "/new/#{model}/configure/overview/#{trim}/#{derivative}"
  end

  def engine(model, trim, derivative)
    "/new/#{model}/configure/engine/#{trim}/#{derivative}"
  end

  def overview_shortcode
    @browser.span(class: 'globe-icon')
  end

  def shortcode_url_field
    @browser.p(id: 'shortcode').text_field
  end

  def overview_car_header
    @browser.div(id: 'config-section').li(class: 'overview').h2
  end

  def overview_book_test_drive
    # @browser.link(:class => "test-drive")
    @browser.div(class: 'next-steps').link(href: /book-a-test-drive/i)
    # @browser.execute_script("return document.getElementsByClassName('test-drive')")
  end

  def overview_finance_calculator
    @browser.div(class: 'next-steps').link(href: /financeCalculator/i)
    # @browser.link(:class => "finance-calculator")
  end

  def overview_save_button
    @browser.div(class: 'vw-saving').button
  end

  def save_configuration_field
    @browser.text_field(id: 'js-car-name')
  end

  def save_configuration_button
    @browser.div(class: 'vw-saving-menu').link(class: 'submit')
  end

  def overview_section
    @browser.li(class: 'overview')
  end

  def next_button
    @browser.div(id: 'configurator').div(id: 'config-nav').button(class: 'next')
  end

  def visible_option_set
    @browser.div(id: 'config-section').ul.lis
  end

  def options
    visible_option_set.select(&:visible?)[0].uls(class: 'configure-item-container')
  end

  def conflict_container
    @browser.div(class: 'conflict-decisions')
  end

  def conflict_options
    conflict_container.div(class: 'conflict-decision').divs(class: 'conflict-item')
  end
end
