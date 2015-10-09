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



end
