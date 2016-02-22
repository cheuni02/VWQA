class BookAServiceStep4 < BookAService
  def page_loaded?
    # convenience_option(0).wait_until_present
    calender.present?
  end

  def select_loan_car_option
    convenience_option(1).click
  end

  def loan_car_self_insured_option_present?
    loan_car_self_insured.present?
  end

  def loan_car_with_insurance_option_present?
    loan_car_with_insurance.present?
  end

  def select_collect_return_option
    convenience_option(3).click
  end

  def up_to_twenty_mins_present?
    twenty_minutes_drive.present?
  end

  def up_to_fourty_mins_present?
    fourty_minutes_drive.present?
  end

  def visit
    visit_page(page_url)
  end

  def select_arrival_time(value)
    collection_time.select(/#{value}/i)
  end

  private

  def calender
    @browser.div(id: 'calendar')
  end

  def page_url
    '/owners/service-booking/convenienceOption?vehicleDetailsFound=true&dealerNumber=00670&pc=Uxbridge&derivative=GOLF+PLUS+SE+TDI&engineCapacity=1.9&engineNumber=BKC+935926&fuelType=Diesel&hasServicePlan=false&hasWarranty=false&isLeased=false&isRTCRetailer=false&mileage=10000&model=golf&registrationDate=2006-03-15&registrationNumber=FE06KHO+&transmission=Manual&vehicleIdentificationNumber=WVWZZZ1KZ6W597938&year=2006&requiresDOB=false&collection=false&delivery=false&optInEmail=true&optInPhone=true&optInPost=true&optInText=true&optInThirdParty=true&workOption1=384&_workOption4=&_workOption7=&_workOption7=&_workOption7=&_workOption7=&_workOption7=&_workOption7=&otherChecks=&additionalInformation='
  end

  def collection_time
    @browser.select(id: 'collectionTime')
  end

  def convenience_option(index)
    @browser.radio(class: 'js-con-options', index: index)
  end

  def loan_car_self_insured
    @browser.label(for: 'collectionOption600')
  end

  def loan_car_with_insurance
    @browser.label(for: 'collectionOption376')
  end

  def twenty_minutes_drive
    @browser.label(for: 'collectionOption824')
  end

  def fourty_minutes_drive
    @browser.label(for: 'collectionOption2848')
  end
end
