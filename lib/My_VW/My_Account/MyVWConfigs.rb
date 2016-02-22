class MyVWConfigs < MyVW
  def visit
    visit_page(page_url)
  end

  def configs_shown?
    has_configurations.present?
  end

  def no_configs_shown?
    @browser.refresh
    no_configurations.present?
  end

  def visit_config_page
    visit_page(p_url)
  end

  def selecting_model(model)
    @browser.link(href: "/new/#{model}/configure")
  end

  def trim
    selecting_trim
  end

  def configure_model
    engine_config
    paint_config
    overview_config
  end

  def save_config
    click_save_button
    naming_config
    saving_config
  end

  def my_config
    my_configurations_page
  end

  def created_config_exists
    check_configuration_exists
  end

  def checking_config_data
    correct_data
  end

  def selecting_vehicle(car)
    @browser.link(href: "/new/#{car}/configure")
  end

  def editing_configuration_button
    edit_config
  end

  def back_on_configurator
    configurator_check
  end

  def another_change
    paint_config
    change_paint_config
    extras_config
    change_extras_config
    overview_config
  end

  def clicking_car(trim)
    @browser.link(href: "/new/#{trim}/configure")
  end

  def delete_config
    select_config
    deleting_a_configuration
  end

  def java_pop_up
    javascript_dialogue_box
  end

  def config_check_after_deletion
    configuration_check_after_removed
  end

  private

  def page_url
    '/owners/my/configurations'
  end

  def no_configurations
    @browser.div(class: 'no-configurations')
  end

  def has_configurations
    @browser.div(id: 'configured-cars')
  end

  def p_url
    '/configurator'
  end

  def selecting_trim
    @browser.button(class: 'vw-btn choose', index: 0)
  end

  def engine_config
    @browser.div(class: 'engine-image').wait_until_present
    @browser.div(class: 'engine-image', index: 1).click
  end

  def paint_config
    @browser.div(id: 'config-nav').ul.li(index: 3).click
    @browser.div(class: 'paint-swatch').wait_until_present
  end

  def overview_config
    @browser.div(id: 'config-nav').ul.li(index: 6).click
    @browser.div(id: 'config-section').wait_until_present
  end

  def click_save_button
    @browser.button(text: 'Save').wait_until_present
    @browser.button(text: 'Save').click
  end

  def naming_config
    @browser.div(class: 'menu-content').wait_until_present
    @browser.text_field(id: 'js-car-name').set 'tester'
  end

  def saving_config
    @browser.link(class: 'vw-btn submit').click
    @browser.div(class: 'vw-confirmation-menu').wait_until_present
  end

  def my_configurations_page
    @browser.link(href: '/owners/my').click
    @browser.link(href: '/owners/my/configurations').click
  end

  def check_configuration_exists
    @browser.h4(text: 'tester').present?
  end

  def correct_data
    @browser.h4(text: 'tester').click
    @browser.div(class: 'description').present?
    @browser.div(class: 'options').present?
  end

  def edit_config
    @browser.h4(text: 'tester').click
    @browser.span(class: 'vw-icon-link').click
  end

  def configurator_check
    @browser.div(id: 'config-nav').ul.li(class: 'overview current').present?
  end

  def change_paint_config
    @browser.ul(class: 'configure-item-container grid-1', index: 1).li(class: 'configure-item info-item', index: 1).click
  end

  def extras_config
    @browser.div(id: 'config-nav').ul.li(index: 5).click
    @browser.div(id: 'config-section').wait_until_present
  end

  def change_extras_config
    @browser.div(id: 'config-section').li(class: 'extras').div(class: 'content grid-row').ul(class: 'configure-item-container grid-2').li(index: 1).click
  end

  def select_config
    @browser.h4(text: 'tester').click
  end

  def deleting_a_configuration
    @browser.link(class: 'js-delete').click
    @browser.alert.exists?
    @browser.alert.ok
  end

  def configuration_check_after_removed
    @browser.h4(text: 'tester').present?
  end
end
