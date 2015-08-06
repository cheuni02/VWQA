class MyVWAddCar < MyVW

  def page_loaded?
    car_status_container.present?
  end

  def current_car
    current_car_radio.when_present.click
  end

  def previous_car
    previous_car_radio.when_present.click
  end

  def ordered_car
    ordered_car_radio.when_present.click
  end

  def enter_reg(reg_number)
    registration_number.when_present.click
    registration_number.set(reg_number)
    registration_number.send_keys(:enter)
  end

  def enter_order_number(ordernumber)
    order_number.when_present.set(ordernumber)
  end

  def private_owned
    car_ownership_own.when_present.click
  end

  def company_owned
    car_ownership_company.when_present.click
  end

  def company_name(company)
    car_ownership_company_name.when_present.set(company)
  end

  def new_car
    car_acquired_new.when_present.click
  end

  def used_car
    car_acquired_used.when_present.click
  end

  def enter_name(name)
    car_name.when_present.set(name)
    car_name.when_present.click
  end

  def enter_ordered_car_name(name)
    order_car_name.when_present.set(name)
  end

  def register_car
    add_car_confirm.when_present.click
  end

  def search_for_car
    car_search.click
  end

  def add_car_default(reg, name)
    current_car
    enter_reg(reg)
    search_for_car
    private_owned
    new_car
    enter_name(name)
    register_car
  end

  private

  def car_status_container
    @browser.div(:id => "js-car-status")
  end

  def previous_car_radio
    car_status_container.div(:id => 'uniform-carStatus', :index => 0)
  end

  def ordered_car_radio
    car_status_container.div(:id => 'uniform-carStatus', :index => 1)
  end

  def current_car_radio
    car_status_container.div(:id => 'uniform-carStatus', :index => 2)
  end

  def order_number
    @browser.text_field(:id => 'order-number')
  end

  def order_car_name
    @browser.text_field(:id => 'ordered-car-name')
  end

  def registration_number
    @browser.text_field(:id => 'registration-number')
    #@browser.text_field(:id => 'registration-number').send_keys :enter
  end

  def car_ownership_container
    @browser.div(:class => 'car-ownership')
  end

  def car_ownership_own
    car_ownership_container.div(:id => 'uniform-ownership', :index => 0)
  end

  def car_ownership_company
    car_ownership_container.div(:id => 'uniform-ownership', :index => 1)
  end

  def car_ownership_company_name
    car_ownership_container.text_field(:id => 'my-leasing-company')
  end

  def car_acquired_container
    @browser.div(:class => 'acquired-as')
  end

  def car_acquired_new
    car_acquired_container.div(:id => 'uniform-purchaseType', :index => 0)
  end

  def car_acquired_used
    car_acquired_container.div(:id => 'uniform-purchaseType', :index => 1)
  end

  def car_name
    @browser.text_field(:id => 'car-name')
  end

  def add_car_confirm
    @browser.div(:class => 'form-row-buttons').button(:class => 'vw-btn-active')
  end

  def car_search
    @browser.button(:class => 'js-registration-submit')
  end

end
