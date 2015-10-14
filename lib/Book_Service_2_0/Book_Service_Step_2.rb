class BookAService2Step2 < BookAService2

  def page_loaded?
    personal_details_panel.wait_until_present
  end

  def get_service_plan_info
    service_plan_info.text
  end



  private

  def service_plan_info
    car_details_panel_right.li(:id => "myCarDetailsDerivative")
  end

  def car_details_panel_right
    @browser.div(:id => "carDetailsViewRight")
  end

  def personal_details_panel
    @browser.div(:id => "myDetailsEditLeft")
  end

end
