class MyVWProfile < MyVW
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    car_panel.wait_until_present
  end

  def set_new_car_name(value)
    new_car_name.set(value)
  end

  def save_new_car
    save_car.each do |button|
      button.click if button.present?
    end
  end

  def email_alert_button_present?
    email_alert_button.present?
  end

  def click_email_alert_button
    email_alert_button.when_present.click
  end

  def set_alert_email(email)
    alert_email_field.set(email)
    set_email_checkbox
  end

  def set_email_checkbox
    email_checkbox.set
  end

  def accept_terms
    alert_terms.set
  end

  def save_alert_settings
    save_alerts.when_present.click
  end

  def set_car_order_number(number)
    car_order_number.set(number)
  end

  def book_service_button_present?
    book_service_button.present?
  end

  def check_next_steps_links
    next_actions_panel_links
  end

  def faq_present?
    faq_container.present?
  end

  def get_faq_supp_link
    faq_supp_link
  end

  def get_faq_links
    faq_links
  end

  def how_to_videos_present?
    how_to_videos.present?
  end

  def book_service
    book_service_button.click
  end

  def add_car_button_present?
    add_car_button.present?
  end

  def add_car
    add_car_button.click
  end

  def get_faq_content
    faq_content
  end

  def check_name(_name)
    selected_car_link.text
  end

  def hero_title
    @browser.element(class: 'full-hero__title', text: 'My Account')
  end

  def personal_details
    @browser.element(id: 'section-personal-details-form')
  end

  def page_url
    '/owners/my/cars'
  end

  def car_panel
    @browser.div(id: 'car-info')
  end

  def next_actions_panel
    @browser.div(id: 'next-actions')
  end

  def next_actions_panel_links
    next_actions_panel.links(class: 'vw-btn')
  end

  def new_car_name
    @browser.text_field(id: 'ordered-car-name')
  end

  def car_order_number
    @browser.text_field(id: 'order-number')
  end

  def save_car
    @browser.buttons(name: 'save')
  end

  def car_details
    @browser.div(id: 'car-details-links')
  end

  def book_service_button
    car_details.link(text: 'Book a service')
  end

  def add_car_button
    @browser.link(text: 'Add car')
  end

  def email_alert_button
    car_details.link(class: 'vw-btn-active')
  end

  def alert_email_field
    @browser.text_field(id: 'alert-email')
  end

  def email_checkbox
    @browser.checkbox(id: 'emailNotifications')
  end

  def alert_terms
    @browser.checkbox(id: 'termsAndConditions')
  end

  def save_alerts
    @browser.button(class: 'vw-btn-active')
  end

  def faq_container
    @browser.div(id: 'top-owners-faqs')
  end

  def faq_supp_link
    faq_container.ul(class: 'supplementary-links')
  end

  def faq_links
    faq_container.lis(class: 'vw-button')
  end

  def faq_content
    faq_container.li(class: /is\-open/).p.text
  end

  def how_to_videos
    @browser.div(id: 'how-to-videos')
  end

  def car_nav
    @browser.div(id: 'cars-nav')
  end

  def selected_car_link
    car_nav.link(class: 'selected')
  end
end
