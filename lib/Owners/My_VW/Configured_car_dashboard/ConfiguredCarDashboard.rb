class ConfiguredCarDashboard < BrowserContainer

  def configuration_page_present?
    configured_car_hero.present?
    my_configured_menu.present?
    my_configured_summary.present?
  end

  def configured_car_click
    my_cars_menu.hover
    configured_car_click.when_present.click
  end

  def configured_car_recovery_buttons_present?(buttons)
    @browser.div(:class => "my-offers__feature aligner").link(:text => "#{buttons}").present?
  end

  def configured_car_sections_present?(details)
    @browser.section(:class => "#{details}").present?
  end

  def my_configured_car_present?
    configured_car_hero.present?
    name_of_configuration.present?
  end

  def configured_car_user_present?(actions)
    @browser.div(:class => "full-hero__content").text("#{actions}").present?
  end

  def further_down_page_present?
    promotions_section.present?
  end

  def book_test_drive_button_present?
    book_test_drive.present?
  end

  def specification_section_present?
    my_specifications_section.present?
  end

  def specifcation_table_present?
    spec_table.present?
  end

  def specifications_section_links_present?
    terms_link.present?
    spec_dimensions_link.present?
  end

  def standard_features_section_present?
    my_configured_standard_features.present?
  end

  def click_expand_features_link
    standard_features_expand.click
  end

  def standard_features_expanded_present?
    standard_features_expanded_section.present?
  end

  private

  def get_showroom_account

  end

  def get user_invalid_config

  end

  def name_of_configuration
    @browser.h1(:class => "full-hero__title")
  end

  def configured_car_hero
    @browser.section(:class => "configured-car-hero")
  end

  def book_test_drive
    @browser.nav(:class => "full-hero__button").a(:text => "Book a test drive")
  end

  def edit_configuration_link
    @browser.nav(:class => "full-hero__links").a(:index => 0).span(:text => "Edit configuration")
  end

  def print_configuration_link
    @browser.nav(:class => "full-hero__links").a(:index => 1).span(:text => "Print configuration")
  end

  def my_cars_menu
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
  end

  def configured_car_link
    @browser.div(:class => "my-cars-dropdown-cars").image(:alt => "MyBeetle")
  end

  def my_configured_summary
    @browser.section(:class => "my-configured-summary")
  end

  def my_specifications_section
    @browser.section(:class => "my-configured-spec__body")
  end

  def spec_dimensions_link
    @browser.div(:class => "my-configured-spec__link--bottom").a(:text => "Dimensions")
  end

  def spec_table
    @browser.tables(:class => "spec-table")
  end

  def terms_link
    @browser.link(:id => "toggle-terms-conditions-link")
  end

  def my_configured_base_features
    @browser.section(:class => "my-configured-feature")
  end

  def my_configured_standard_features
    @browser.section(:class => "my-configured-standard")
  end

  def standard_features_expand
    @browser.link(:id => "toggle-features-link")
  end

  def standard_features_expanded_section
    @browser.div(:id => "standard-features")
  end

  def configurator_link
    @browser.h3(:class => "my-configured-retailer__title--blue")
  end

  def book_appointment_button
    @browser.div(:class => "my-configured-retailer__button").link
  end

  def choose_retailer_link
    @browser.div(:class => "my-configured-retailer__link").link
  end

  def promotions_section
    @browser.section(:class => "my-promo")
  end

end
