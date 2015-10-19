class BookAService2Step1 < BookAService2

  def page_loaded?
    car_details_edit_panel.wait_until_present
  end

  def set_mileage_field(mileage)
    mileage_field.when_present.set(mileage)
  end

  def click_step_2_button
    step2_button.when_present.click
  end

  def set_interested_in_plan
    interested_in_plan_checkbox.set
  end

  def set_already_have_plan(active = true)
    if ((already_have_plan_checkbox.set? && !(active)) || (active && !(already_have_plan_checkbox.set?)))
      have_service_plan_label.click
    end
  end

  def set_extended_warrenty(active = true)
    if ((warrenty_checkbox.set? && !(active)) || (active && !(warrenty_checkbox.set?)))
      warrenty_label.click
    end
  end

  def set_leased_car(active = true)
    if ((leased_car_checkbox.set? && !(active)) || (active && !(leased_car_checkbox.set?)))
      leased_car_label.click
    end
  end

  def interested_in_plan_present?
    interested_in_plan_label.present?
  end

  def set_leased_car_field(text)
    leased_car_field.when_present.set(text)
  end

  def click_registration_lookup
    registration_lookup_button.when_present.click
  end

  def click_lookup_button
    registration_lookup.when_present.click
  end

  def set_registration_field(text)
    registration_field.when_present.set(text)
  end

  def do_registration_lookup
    registration_lookup.when_present.click
  end

  def click_select_car
    select_car_button.when_present.click
  end

  def get_derivative_name
    derivative_name_field.when_present.value
  end

  def do_step_1
    click_registration_lookup
    set_registration_field("FY13MWD")
    click_lookup_button
    click_select_car
    sleep 2 #had to use as it is waiting for fields to be populated
  end

  private

  def car_details_edit_panel
    @browser.div(:id => "carDetailsEditLeft")
  end

  def mileage_field
    @browser.text_field(:id => "mileage")
  end

  def step2_button
    @browser.button(:id => "goto-myDetails")
  end

  def interested_in_plan_label
    @browser.label(:for => "wantServicePlan")
  end

  def have_service_plan_label
    @browser.label(:for => "hasServicePlan")
  end

  def interested_in_plan_checkbox
    @browser.checkbox(:id => "wantServicePlan")
  end

  def already_have_plan_checkbox
    @browser.checkbox(:id => "hasServicePlan")
  end

  def warrenty_label
    @browser.label(:for => "hasWaranty")
  end

  def warrenty_checkbox
    @browser.checkbox(:id => "hasWaranty")
  end

  def leased_car_checkbox
    @browser.checkbox(:id => "isLeased")
  end

  def leased_car_label
    @browser.label(:for => "isLeased")
  end

  def leased_car_field
    @browser.text_field(:id => "leaseCompany")
  end

  def registration_lookup_button
    @browser.button(:id => "button-regLookup")
  end

  def registration_field
    @browser.text_field(:id => "registration-numberSB")
  end

  def registration_lookup
    @browser.button(:id => "button-regLookup-submit")
  end

  def select_car_button
    @browser.button(:id => "button-selectCar")
  end

  def derivative_name_field
    @browser.text_field(:id => "derivative")
  end
end
