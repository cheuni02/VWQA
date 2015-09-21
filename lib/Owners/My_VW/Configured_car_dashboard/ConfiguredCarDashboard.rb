class ConfiguredCarDashboard < BrowserContainer


  def configuration_page
    configured_car_hero.present?
    my_configured_menu.present?
    my_configured_summary.present?
  end

  def configured_car_click
    my_cars_menu.hover
    configured_car_click.when_present.click
  end

  def configured_car_recovery_button(buttons)
    @browser.div(:class => "my-offers__feature aligner").link(:text => "#{buttons}")
  end

  def configured_car_section(details)
    @browser.section(:class => "#{details}").present?
  end

  def my_configured_car
    configured_car_hero.present?
    name_of_configuration.present?
  end

  private

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

  def my_configured_gallery
    @browser.section(:class => "my-configured-gallery")
  end

  def my_configured_specifications
    @browser.section(:class => "my-configured-spec")
  end

  def spec_dimensions_link
    @browser.div(:class => "my-configured-spec__link--bottom").a(:text => "Dimensions")
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
