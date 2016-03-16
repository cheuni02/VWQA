class BookAServiceStep3 < BookAService
  def page_loaded?
    price_heading.present?
  end

  def expand_work_list_option
    items = expand_work_list[1..2]
    items.each do |item|
      item.when_present.h2.click
    end
  end

  def total_price_text
    total_price_text_message
  end

  def get_price
    price_total.text
  end

  def select_MOT_test
    # additional_info_field.wait_until_present
    mot_test_radio.when_present.click
  end

  def get_MOT_price
    mot_test_label.text
  end

  def select_aircon_refresh
    # additional_info_field.wait_until_present
    aircon_refresh_radio.when_present.click
  end

  def select_front_brake_pad_service
    # additional_info_field.wait_until_present
    front_brake_pad_radio.when_present.click
  end

  def select_rear_brake_pad_service
    # additional_info_field.wait_until_present
    rear_brake_pad_radio.when_present.click
  end

  def select_battery_replacement
    # additional_info_field.wait_until_present
    battery_replacement.when_present.click
  end

  def quotation_header_present?
    quotation_header.present?
  end

  def set_additional_info(text)
    additional_info_field.set(text)
  end

  def select_brake_fluid_change
    brake_fluid_change.when_present.click
  end

  def visit
    visit_page(page_url)
  end

  def workgroup_container
    @browser.divs(class: "booking-accourdian")
  end

  def count_datagroup
    i=0
    workgroup_container.each do
      i+=1
    end
    return i
  end

  def spec_workgroup_container(i)
    @browser.div(class: "booking-accourdian", index: i)
  end

  def count_work_option(datagroup)
    i=0
    spec_workgroup_container(datagroup).lis.each do
      i+=1
    end
    return i
  end

  def spec_work_option(datagroup, i)
    spec_workgroup_container(datagroup).li(index: i).label
  end

  def select_random_work
     select_rand_group = 1 + rand(count_datagroup - 1)
     select_rand_work = rand(count_work_option(select_rand_group))
     spec_workgroup_container(select_rand_group).h2.click
     Watir::Wait.until{spec_work_option(select_rand_group,select_rand_work)}.click
  end

  def emissions_fix_option
    spec_workgroup_container(0).h2(:text => 'Emissions Service Action')
  end

  def emissions_fix_option_checked
    spec_workgroup_container(0).label.span(class: "checked")
  end

  private

  def page_url
    '/owners/service-booking/workRequired?vehicleIdentificationNumber=WVWZZZ1KZ6W597938&engineNumber=BKC+935926&isRTCRetailer=false&registrationDate=2006-03-15&vehicleDetailsFound=true&dealerNumber=00670&pc=Uxbridge&requiresDOB=false&collection=false&delivery=false&optInEmail=true&optInPhone=true&optInPost=true&optInText=true&optInThirdParty=true&registrationNumber=FE06KHO+&model=golf&derivative=GOLF+PLUS+SE+TDI&engineCapacity=1.9&year=2006&transmission=Manual&fuelType=Diesel&mileage=10000&hasServicePlan=false&hasWarranty=false&isLeased=false&leaseCompany='
  end

  def price_heading
    @browser.h2(id: 'totalPriceHeading')
  end

  def expand_work_list
    @browser.divs(class: 'work-list-category')
  end

  def total_price_text_message
    @browser.span(id: 'retailer-quote')
  end

  def price_total
    @browser.span(id: 'total-price')
  end

  def mot_test_radio
    # @browser.div(:id => "uniform-workOption1608")
    @browser.label(for: 'workOption134748')
    # @browser.execute_script("return document.getElementById('workOption1384')")
  end

  def aircon_refresh_radio
    # @browser.div(:id => "uniform-workOption225688")
    # @browser.execute_script("return document.getElementById('workOption225688')")
    @browser.label(for: 'workOption225688')
  end

  def mot_test_label
    @browser.label(for: 'workOption134748')
  end

  def front_brake_pad_radio
    # @browser.div(:id => "uniform-workOption530923")
    # @browser.execute_script("return document.getElementById('workOption530923')")
    @browser.label(for: 'workOption534611')
  end

  def rear_brake_pad_radio
    # @browser.div(:id => "uniform-workOption530919")
    # @browser.execute_script("return document.getElementById('workOption530919')")
    @browser.label(for: 'workOption634612')
  end

  def battery_replacement
    # @browser.div(:id => "uniform-workOption76880")
    # @browser.execute_script("return document.getElementById('workOption76880')")
    @browser.label(for: 'workOption76880')
  end

  def quotation_header
    @browser.span(id: 'retailer-quote')
  end

  def additional_info_field
    @browser.textarea(id: 'otherChecks')
  end

  def brake_fluid_change
    # @browser.label(:for => "workOption41280")
    @browser.label(for: 'workOption41280')
  end
end
