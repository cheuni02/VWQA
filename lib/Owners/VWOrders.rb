class VwOrders < Owners

  def visit
    visit_page(page_url)
  end
  
  def page_loaded?
    build_phase_panel.present?
  end

  def find_order(order_number)
    order_field.when_present.set(order_number)
    order_field.send_keys :enter
  end
  
  def get_errors
    text = ""
    text = order_errors.text if order_errors.present?
    return text
  end
  
  def car_details_present?
    car_details_panel.present?
  end
  
  def retailer_details_present?
    retailer_details_panel.present?
  end
  
  def click_alert_signup
    alert_signup_button.when_present.click
  end
  
  private
  
  def page_url
    "/owners/track-my-order"
  end

  def build_phase_panel
    @browser.div(:id => "build-phase")
  end
  
  def order_field
    @browser.text_field(:id => "orderNumber")
  end
  
  def order_errors
    @browser.div(:class => "error")
  end
  
  def car_details_panel
    @browser.div(:id => "my-car")
  end
  
  def retailer_details_panel
    @browser.div(:id => "my-retailer")
  end
  
  def alert_signup_button
    @browser.div(:class => "top-widget-alert").link
  end






end