class DeleteCar < MyVW

  def visit
    visit_page(page_url)
  end

  def my_cars_hover
    my_cars_dropdown.hover
  end

  def ordered_car_present
    ordered_car.present?
  end

  def current_car_present
  current_car.present?
  end

  def delete_ordered_car
    del_ordered_car.click
  end

  def delete_current_car
    del_current_car.click
  end

  def popup_alert_present
    popup_alert_delete.present?
  end

  def popup_alert_confirm
    popup_alert_ok.click
  end

  def popup_alert_cancel
    popup_alert_canc.click
  end

  private

  def page_url
    "/owners/my/cars"
  end

  def my_cars_dropdown
    @browser.ul(:class => "welcome-stripe__menu-list", :index => 1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
  end

  def ordered_car
    @browser.div(:class => "status-ordered-car", :index => 0)
  end

  def current_car
    @browser.a(:href => "#").div(:class => "my-cars-dropdown").div(:class => "status-current-car", :index => 0)
  end

  def del_ordered_car
    @browser.div(:class => "status-ordered-car", :index => 0).a(:class => "my-vw-confirm-link")
  end

  def del_current_car
    @browser.div(:class => "status-current-car", :index => 0).a(:class => "my-vw-confirm-link")
  end

  def popup_alert_delete
    @browser.div(:class => "my-overlay__content--tiny").h2(:text => "Are you sure?")
  end

  def popup_alert_ok
    @browser.div(:class => "my-overlay__buttons").a(:class => "my-overlay__confirm-button")
  end

  def popup_alert_canc
    @browser.div(:class => "my-overlay__buttons").a(:class => "my-overlay__cancel-button")
  end
end