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

  def interested_in_plan_present?
    interested_in_plan_label.present?
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



end
