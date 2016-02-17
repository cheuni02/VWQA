require 'json'
class CurrentCarDashboard < MyVW
  def visit
    visit_page(page_url)
  end

  def current_dashboard_section_present?
    current_car_hero.present?
    my_car_nav_menu.present?
  end

  def my_service_history_table_present?
    service_history_table.visible?
  end

  def my_plans_present?
    volkswagen_plans_section.present?
  end

  def promotions_section
    @browser.div(class: 'col-6 my-promo__features')
  end

  def promotions_by_title(promotions)
    promotions_section.a(title: "#{promotions}")
  end

  def footer_buttons(buttons)
    @browser.div(class: 'row my-offers__features').a(text: "#{buttons}")
  end

  def scroll_to_promotions_section
    scroll_to(promotions_section)
  end

  def scroll_to_service
    scroll_to(my_service_plans_history)
  end

  def scroll_to_help
    scroll_to(need_help_module)
  end

  def scroll_footer_buttons
    scroll_to(recovery_zone_buttons)
  end

  def page_url
    '/vw-authentication/login/auth?targetUrl=/owners/my/cars'
  end

  def my_car_nav_menu
    @browser.section(class: 'welcome-stripe').nav(class: 'welcome-stripe__menu')
  end

  def useful_link(text)
    @browser.h5(class: 'my-help-box__title', text: text).parent.link
  end

  def my_car_hero
    @browser.h1(class: 'full-hero__title')
  end

  def my_car_photo
    @browser.element(class: 'current-car-hero').attribute_value('className').split(' ').last
  end

  def camera_button
    @browser.form(id: 'form-upload-image').label(id: 'img-placeholder-link')
  end

  def current_car_hero
    @browser.section(class: 'current-car-hero')
  end

  def current_service_section
    @browser.section(class: 'my-current-service')
  end

  def current_service_overview
    @browser.section(class: 'my-current-service').div(class: 'my-current-service__content')
  end

  def retailer_map
    @browser.div(class: 'my-retailer__map')
  end

  def retailer_details
    @browser.div(class: 'my-retailer__overlay')
  end

  def retailer_address_details
    retailer_details.address(class: 'vcard')
  end

  def retailer_contact_details(field)
    retailer_details.div(class: 'my-retailer__contact', text: /#{field}/).text.gsub(field, '').strip
  end

  def retailer_website_link
    retailer_details.link(class: 'my-vw-text-link my-vw-text-link--blue')
  end

  def service_gurantee_section
    @browser.section(class: 'my-current-guarantee')
  end

  def my_service_history_section
    @browser.section(class: 'my-current-history')
  end

  def service_history_table
    @browser.div(class: 'my-current-history__body').table(class: 'my-table--transparent')
  end

  def volkswagen_plans_section
    @browser.section(class: 'my-current-plan').table(class: 'my-table--white')
  end

  def promotion_section
    @browser.section(class: 'my-promo')
  end

  def promotion_headline
    @browser.div(class: 'my-promo__headline')
  end

  def need_help_module
    @browser.element(class: 'my-help__title')
  end

  def need_help_search_field
    @browser.text_field(id: 'searchTerm')
  end

  def need_help_search_button
    @browser.button(id: 'searchSubmit')
  end

  def recovery_zone_buttons
    @browser.div(class: 'row my-offers__features')
  end

  def my_service_plans_history
    @browser.section(class: 'my-current-service-history')
  end

  def owner_postcode_field
    @browser.text_field(id: 'owner-postcode')
  end

  def dbg_not_matched_message
    @browser.header(class: 'col-6 section__header')
  end

  def last_name_field
    @browser.text_field(id: 'owner-surname')
  end
end
