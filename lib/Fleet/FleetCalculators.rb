class FleetCalculators < Fleet
  
  def whole_life_calc
    FleetLifeValue.new(@browser)
  end
  
  def company_car_tax_calc
    FleetCompanyTaxCalc.new(@browser)
  end

  def residual_value
    FleetResidualValue.new(@browser)
  end


  def click_whole_life
    fleet_calculator_link.parent.when_present.click
  end
  
  def click_company_car_tax
    tax_calculator_link.parent.when_present.click
  end

  def click_residual_value
    fleet_residual_value_link.parent.when_present.click
  end

  private

  def fleet_calculator_link
    @browser.div(:class => "fleet-calculator", :index => 0)
  end
  
  def tax_calculator_link
    @browser.div(:class => "tax-calculator")
  end

  def fleet_residual_value_link
    @browser.div(:class => "fleet-calculator", :index => 1)
  end


end