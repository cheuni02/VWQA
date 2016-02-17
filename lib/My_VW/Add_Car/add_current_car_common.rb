require 'json'
class AddCurrentCarCommon < MyVW
  def visit
    visit_page(page_url)
  end

  def scroll_up
    scroll_to(:center)
  end

  def scroll_to_add_a_car
    scroll_to(select_add_a_car)
  end

  def select_my_cars
    @browser.element(class: 'welcome-stripe__body').element(class: 'welcome-stripe__menu-list', index: 1)
  end

  def select_add_a_car
    @browser.link(text: 'Add a car')
  end

  def loading_wheel
    @browser.div(id: 'page').div(class: 'my-loading-shield')
  end

  def add_a_car_choices
    @browser.element(id: 'add-car-main')
  end

  def page_url
    '/owners/my/cars/add'
  end

  def continue_to_next_step
    @browser.element(class: 'my-vw-button', text: /Continue/)
  end

  def retailer_location_search
    @browser.text_field(id: 'retailer-location-search')
  end

  def retailer_name_search
    @browser.text_field(id: 'retailer-name-search')
  end

  def back_button
    @browser.element(id: 'my-go-back-button')
  end

  def leave_overlay
    @browser.element(id: 'leaving-dialog')
  end

  def leave_overlay_title
    leave_overlay.element(class: 'my-overlay__title')
  end

  def cancel_back_button
    leave_overlay.element(class: 'my-overlay__cancel-button')
  end

  def confirm_back_button
    leave_overlay.element(id: 'leaving-dialog-confirm')
  end
end
