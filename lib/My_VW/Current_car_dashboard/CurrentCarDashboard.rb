require 'json'
class CurrentCarDashboard < MyVW

  def visit
    visit_page(page_url)
  end

  def my_name_present?
    welcome_name.present?
  end

  def wait_for_load
    need_help_module.wait_until_present
  end

  def retailer_map_present?
    retailer_map.present?
  end

  def hero_text_present?
    my_car_hero.present?
  end

  def camera_icon_present?
    camera_button.present?
  end

  def get_retailer_address
    retailer_address_details.text
  end

  def get_retailer_contact(type)
    retailer_contact_details(type).text
  end

  def click_my_retailer_link
    retailer_website_link.when_present.click
  end

  def current_dashboard_section_present?
    current_car_hero.present?
    my_car_nav_menu.present?
  end

  def click_camera_icon
    camera_button.click
  end

  def upload_image_prompt
    close_image_picker.send_keys :enter
  end

  def my_service_gurantee_module_present?
    service_gurantee_section.present?
  end

  def click_a_gurantee(gurantee)
    @browser.div(:class => "my-current-guarantee__body").link(:href => "#{gurantee}").click
  end

  def check_page_url(page)
    relevant_page = page
    url = @browser.url
    page_url = url.split('/')
    return page_url.last
    #if relevant_page == page_url.last
    #  return true
    #else
    #  return false
    #end
  end

  def my_service_history_present?
    current_service_section.present?
  end

    def my_service_history_table_present?
    service_history_table.visible?
  end

  def my_plans_present?
    volkswagen_plans_section.present?
  end

  def promo_section_present?
    promotion_section.present?
  end

  def promotions_present?(promotions)
    @browser.div(:class => "col-6 my-promo__features").a(:title => "#{promotions}").present?
  end

  def promo_headline_offer_present?
    promotion_headline.present?
  end

  def need_help_section_present?
    need_help_module.present?
  end

  def need_help_search_present?
    need_help_search_bar.present?
  end

  def check_useful_link_present?(useful_links)
    useful_link(useful_links).present?
  end

  def click_useful_link(text)
    useful_link(text).when_present.click
  end

  def my_vw_page_present?
    current_car_hero.present?
    my_retailer_present?
  end

  def my_retailer_present?
    preferred_retailer.present?
  end

  def retailer_links_present?(links)
    @browser.div(:class => "my-retailer__hours").a(:text => "#{links}").present?
  end

  def recovery_zone_present?
    recovery_zone_buttons.present?
  end

  def check_relevant_buttons_present?(buttons)
    @browser.div(:class => "row my-offers__features").a(:text => "#{buttons}").present?
  end

  def search_help(help)
    @browser.text_field(:id => "searchTerm").set("#{help}")
    need_help_search_button.click
  end

  def my_service_plans_box_present?
    my_service_plans_history.present?
  end

  def dbg_data_needed_present?
    owner_postcode_field.present?
    #last_name_field.present?
  end


  private

  def page_url
    "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
  end

  def current_car_polo
    @browser.div(:class => "my-cars-dropdown").h2(:text => "polobleu")
  end

  def my_car_nav_menu
    @browser.section(:class => "welcome-stripe").nav(:class => "welcome-stripe__menu")
  end

  def my_cars_link
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
  end

  def useful_link(text)
    @browser.h5(:text => "#{text}").parent.link
  end

  def my_car_hero
    @browser.h1(:class => "full-hero__title")
  end

  def camera_button
    @browser.form(:id => "form-upload-image").label(:id => "img-placeholder-link")
  end

  def close_image_picker
    @browser.form(:id => "form-upload-image")
    #@browser.execute_script("window.confirm = function() {return false}")
  end

  def welcome_name
    @browser.section(:class => "welcome-stripe").div(:class => "welcome-stripe__notification")
  end

  def current_car_hero
    @browser.section(:class => "current-car-hero")
  end

  def upcoming_appointment_section
    @browser.section(:id => "upcoming_services")
  end

  def current_service_section
    @browser.section(:class => "my-current-service")
  end

  def current_service_overview
    @browser.section(:class => "my-current-service").div(:class => "my-current-service__content")
  end

  def retailer_map
    @browser.div(:class => "my-retailer__map")
  end

  def retailer_details
    @browser.div(:class => "my-retailer__overlay")
  end

  def retailer_address_details
    retailer_details.address(:class => 'vcard')
  end

  def retailer_contact_details(text)
    retailer_details.div(:class => "my-retailer__contact", :text => /#{text}/)
  end

  def retailer_website_link
    retailer_details.link(:class => "my-vw-text-link my-vw-text-link--blue")
  end

  def service_gurantee_section
    @browser.section(:class => "my-current-guarantee")
  end

  def my_service_history_section
    @browser.section(:class => "my-current-history")
  end

  def service_history_table
    @browser.div(:class => "my-current-history__body").table(:class => "my-table--transparent")
  end

  def volkswagen_plans_section
    @browser.section(:class => "my-current-plan").table(:class => "my-table--white")
  end

  def promotion_section
    @browser.section(:class => "my-promo")
  end

  def promotion_headline
     @browser.div(:class => "my-promo__headline")
  end

  def need_help_module
    @browser.section(:class => "my-help")
  end

  def need_help_search_bar
    @browser.text_field(:id => "searchTerm")
  end

  def need_help_search_button
    @browser.button(:id => "searchSubmit")
  end

  def recovery_zone_buttons
    @browser.div(:class => "row my-offers__features")
  end

  def my_service_plans_history
    @browser.section(:class => "my-current-service-history")
  end

  def owner_postcode_field
    @browser.text_field(:id => "owner-postcode")
  end

  def last_name_field
    @browser.text_field(:id => "owner-surname")
  end

end
