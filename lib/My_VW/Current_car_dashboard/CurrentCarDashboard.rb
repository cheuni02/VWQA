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

  def scroll_to_service_plans_history
    if service_plans_history_populated.present?
      scroll_to(service_plans_history_populated)
    else
      scroll_to(service_plans_history)
    end
  end

  def service_plans_history_populated
    @browser.element(class: 'my-current-history__body')
  end

  def service_type(row = 0, column)
    case column
    when /Service type/
      service_plans_history_populated.table.tbody.trs[row].tds[0].text
    when /Date/
      service_plans_history_populated.table.tbody.trs[row].tds[1].text
    when /Retailer/
      service_plans_history_populated.table.tbody.trs[row].tds[2].text
    when /EVC report/
      service_plans_history_populated.table.tbody.trs[row].tds[3].text
    end
  end

  def plan_section(column)
    case column
    when /Plan/
      volkswagen_plans_section.table.tbody.tds[0].text
    when /Start/
      volkswagen_plans_section.table.tbody.tds[1].text
    when /End/
      volkswagen_plans_section.table.tbody.tds[2].text
    when /Length/
      volkswagen_plans_section.table.tbody.tds[3].text
    when /More Info/
      volkswagen_plans_section.table.tbody.tds[4].text
    end
  end

  def read_more_about_plan
    volkswagen_plans_section.table.tbody.tds[4]
  end

  def scroll_to_my_plan
    scroll_to(volkswagen_plans_section)
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

  def add_car_link
    @browser.element(id: 'car-details-links')
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

  def service_history_table
    @browser.div(class: 'my-current-history__body').table(class: 'my-table--transparent')
  end

  def volkswagen_plans_section
    @browser.div(class: 'my-current-plan__body')
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

  def service_plans_history
    @browser.section(class: 'my-current-service-history')
  end

  def enable_service_history_feature
    @browser.element(class: 'my-vw-button--blue', text: 'Enable feature')
  end

  def dbg_not_matched_message
    @browser.header(class: 'col-6 section__header')
  end

  def last_name_field
    @browser.text_field(id: 'owner-surname')
  end
end
