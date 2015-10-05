class BookAServiceStep5 < BookAService

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    first_name.present?
  end
  
  def set_title(title)
    select_title.select(title)
  end
  
  def set_first_name(name)
    first_name.set(name)
  end
  
  def set_surname(name)
    surname.set(name)
  end
  
  def set_postcode(postcode)
    postcode_field.set(postcode)
  end

  def postcode_search
    postcode_search_button.parent.click
  end
    
  def get_town_info
    town_field.value
  end
  
  def select_collect_from_home
    select_from_home_address_container.wait_until_present
    select_from_home_address.set
  end
 
  def select_deliver_to_home
    select_deliver_home_address_container.wait_until_present
    select_deliver_home_address.set
  end
  
  def collect_postcode_disabled?
    collect_postcode_field.disabled?
  end
  
  def deliver_postcode_disabled?
    deliver_postcode_field.disabled?
  end
  
  def set_telephone(number)
    telephone.set(number)
  end
  
  def set_email(address)
    email.set(address)
  end
  
  def click_email_preference
    email_preference.click
  end
  
  def click_sms_preference
    sms_preference.click
  end
  
  def click_telephone_preference
    telephone_preference.click
  end
  
  def click_post_preference
    post_preference.click
  end
  
  def click_comm_preference
    comm_preference.click
  end
  
  def confirmation_page_loaded?
    confirmation_summary.present?
  end
  
  def set_house_number(number)
    house_number_field.set(number)
  end
  
  def final_confirmation_present?
    final_confirm_panel.present?
  end
  
  private

  def page_url
    "/owners/service-booking/personalDetails?vehicleDetailsFound=true&dealerNumber=00670&pc=Uxbridge&derivative=GOLF+PLUS+SE+TDI&engineCapacity=1.9&engineNumber=BKC+935926&fuelType=Diesel&hasServicePlan=false&hasWarranty=false&isLeased=false&mileage=10000&model=golf&registrationDate=2006-03-15&registrationNumber=FE06KHO+&transmission=Manual&vehicleIdentificationNumber=WVWZZZ1KZ6W597938&year=2006&workOption=384&collection=false&delivery=false&optInEmail=true&optInPhone=true&optInPost=true&optInText=true&optInThirdParty=true&requiresDOB=false&motJobSelected=false&rtcPostcode=&isRTCRetailer=false&collectionDate=date.struct&collectionDate_day=29&collectionDate_month=9&collectionDate_year=2014&collectionTime=9&collectionOption=152&con-options=on"
  end
  
  def select_from_home_address_container
    @browser.div(:id => "uniform-collect-from-home-address")  
  end
  
  def select_deliver_home_address_container
    @browser.div(:id => "uniform-deliver-to-home-address")
  end
  
  def house_number_field
    @browser.text_field(:id => "houseNumber")
  end
  
  def select_title
    @browser.execute_script("return document.getElementById('title')")
  end
  
  def first_name
    @browser.text_field(:id => "firstName")
  end
  
  def surname
    @browser.text_field(:id => "lastName")
  end
  
  def postcode_field
    @browser.text_field(:id => "postcode")
  end
  
  def postcode_search_button
    @browser.span(:class => "vw-icon-search")
  end
  
  def town_field
    @browser.text_field(:id => "city")
  end
  
  def select_from_home_address
    @browser.checkbox(:id => "collect-from-home-address")
  end
  
  def select_deliver_home_address
    @browser.checkbox(:id => "deliver-to-home-address")
  end
  
  def collect_postcode_field
    @browser.text_field(:id => "collectionPostcode")
  end
  
  def deliver_postcode_field
    @browser.text_field(:id => "deliveryPostcode")
  end

  def telephone
    @browser.text_field(:id => "phoneNumber")
  end
  
  def email
    @browser.text_field(:id => "emailAddress")
  end
  
  def email_preference
    @browser.checkbox(:id => "optInEmail")
  end
  
  def sms_preference
    @browser.checkbox(:id => "optInText")
  end
  
  def telephone_preference
    @browser.checkbox(:id => "optInPhone")
  end
  
  def post_preference
    @browser.checkbox(:id => "optInPost")
  end
  
  def comm_preference
    @browser.checkbox(:id => "opt-in-3rd-party")
  end
  
  def confirmation_summary
    @browser.div(:class => "summary")
  end
  
  def final_confirm_panel
    @browser.div(:id => "intro")
  end
end