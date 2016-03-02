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
    if current_history_body.present?
      scroll_to(current_history_body)
    else
      scroll_to(current_service_history_body)
    end
  end

  def current_service_history_body
    @browser.element(class: 'my-current-service-history__body')
  end

  def current_history_body
    @browser.element(class: 'my-current-history__body')
  end

  def service_plans_history_show_more
    current_history_body.element(class: 'my-table__show-more')
  end

  def enable_service_history_feature
    current_service_history_body.element(class: 'my-vw-button', text: 'Enable feature')
  end

  def service_type(row = 0, column)
    case column
    when /Service type/
      current_history_body.table.tbody.trs[row].tds[0].text
    when /Date/
      current_history_body.table.tbody.trs[row].tds[1].text
    when /Retailer/
      current_history_body.table.tbody.trs[row].tds[2].text
    when /EVC report/
      current_history_body.table.tbody.trs[row].tds[3].text
    end
  end

  def plan_section(column)
    case column
    when /Plan/
      service_plan_section.table.tbody.tds[0].text
    when /Start/
      service_plan_section.table.tbody.tds[1].text
    when /End/
      service_plan_section.table.tbody.tds[2].text
    when /Length/
      service_plan_section.table.tbody.tds[3].text
    when /More Info/
      service_plan_section.table.tbody.tds[4].text
    end
  end

  def read_more_about_plan
    service_plan_section.table.tbody.tds[4]
  end

  def scroll_to_my_plan
    scroll_to(service_plan_section)
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
    current_car_hero.attribute_value('className').split(' ').last
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

  def retailer_address_name
    retailer_address_details.div(class: 'org')
  end

  def retailer_address_street
    retailer_address_details.div(class: 'street-address')
  end

  def retailer_address_town
    retailer_address_details.div(class: 'locality')
  end

  def retailer_address_postcode
    retailer_address_details.div(class: 'postal-code')
  end

  def retailer_contact_details(field)
    retailer_details.div(class: 'my-retailer__contact', text: /#{field}/).text.gsub(field, '').strip
  end

  def retailer_website_link
    retailer_details.link(class: 'my-vw-text-link my-vw-text-link--blue')
  end

  def service_history_table
    current_history_body.table(class: 'my-table--transparent')
  end

  def service_plan_section
    @browser.section(class: 'my-current-plan')
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

  def last_name_field
    @browser.text_field(id: 'owner-surname')
  end

  def scroll_to_guarantee_section
    scroll_to(current_guarantee_section)
  end

  def current_guarantee_section
    @browser.div(class: 'my-current-guarantee__body')
  end

  def current_guarantees(text)
    current_guarantee_section.element(class: 'column-list-section-item__heading', text: text)
  end

  def click_guarantee(text)
    current_guarantees(text).parent.link(class: 'my-vw-text-link', text: 'Find out more').click
  end
end
