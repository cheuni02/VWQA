class ConfiguredCarDashboard < MyVW

  def visit
    visit_page(page_url)
  end

  def configuration_page_present?
    configured_car_hero.present?
    my_configured_menu.present?
    my_configured_summary.present?
  end

  def configured_car_recovery_buttons_present?(buttons)
    @browser.div(:class => "my-offers__features").link(:text => "#{buttons}").present?
  end

  def configured_car_sections_present?(details)
    @browser.section(:class => "#{details}").present?
  end

  def my_configured_car_present?
    configured_car_hero.present?
    name_of_configuration.present?
  end

  def configuration_links_present?
    edit_configuration_link.include?("Edit configuration")
    print_configuration_link.include?("Print configuration")
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

  def click_configuration
    get_all_cars.each do |car|
      my_car_link = car.link(:index => 0).href
      if my_car_link =~ /configurations/i
        @browser.goto my_car_link
        break
      end
    end
  end

  def shortcode_present?
    shortcode.present?
  end

  private

  def page_url
    "/owners/my/configurations/c93bd4cb-cba3-4874-a701-caa8f0d97e18"
  end

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
    @browser.nav(:class => "full-hero__links").a(:index => 0).text
  end

  def print_configuration_link
    @browser.nav(:class => "full-hero__links").a(:index => 1).text
  end

  def my_cars_menu
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item")
  end

  def my_cars_list
    @browser.div(:class => "my-cars-dropdown")
  end

  def my_configured_menu
    @browser.section(:class => "my-configured-menu")
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

  def get_all_cars
    @browser.execute_script('return document.getElementsByClassName("my-cars-dropdown-car-detail")')
  end

  def shortcode
    @browser.h3(:class => "my-configured-retailer__title--blue")
  end


end
