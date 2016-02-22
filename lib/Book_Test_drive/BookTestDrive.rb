class BookTestDrive < BrowserContainer
  # Step 1

  def visit
    visit_page(page_url)
  end

  def step_1_present?
    car_grid.present?
  end

  def select_car(model)
    # link = nil
    car_grid.lis.each do |li|
      if li.link.text =~ /#{model}/i
        li.link.click
        break
      end
    end
  end

  def get_url
    @browser.url
  end

  # Step 2

  def postcode_input_present?
    postcode_input.present?
  end

  def step2_info_present?
    retailer_info.present?
  end

  def car_details_present?
    car_info.present?
  end

  def set_postcode(postcode)
    postcode_input.set(postcode)
  end

  def retailer_search
    retailer_search_button.click
  end

  def error_message_present?
    error_message.present?
  end

  def get_retailers
    results
  end

  def select_nearest_retailer
    select_nearest_retailer_button.click
  end

  # Step 3

  def step3_page_loaded?
    calendar.present?
  end

  def get_days
    calendar_days
  end

  def select_day(element)
    element.link.click
  end

  def proceed
    goto_step4.click
  end

  # Step 4

  def step4_page_loaded?
    first_name.present?
  end

  def step4_enter_firstname(firstname)
    first_name.set(firstname)
  end

  def step4_enter_lastname(lastname)
    last_name.set(lastname)
  end

  def step4_enter_housename(housename)
    house_number.set(housename)
  end

  def step4_enter_addressline1(address)
    address_line_1.set(address)
  end

  def step4_enter_town(town)
    step4_town.set(town)
  end

  def step4_enter_postcode(postcode)
    step4_postcode.set(postcode)
  end

  def step4_enter_email(emailaddress)
    email_address.set(emailaddress)
  end

  def step4_enter_phonenumber(phonenumber)
    phone_number.set(phonenumber)
  end

  def submit_details
    step4_submit_button.click
  end

  def get_validation
    validation
  end

  # Confirmation
  def confirmation_page_loaded?
    test_drive_confirm.present?
  end

  def page_url
    '/book-a-test-drive/chooseModel'
  end

  def car_grid
    @browser.ol(class: 'car-thumbnails')
  end

  def postcode_input
    @browser.text_field(id: 'postcode')
  end

  def retailer_info
    @browser.span(class: 'retailer')
  end

  def car_info
    @browser.span(class: 'model')
  end

  def error_message
    @browser.p(class: 'postcode error')
  end

  def retailer_search_button
    @browser.button(class: 'submit', title: 'Search')
  end

  def results
    @browser.div(id: 'results')
  end

  def select_nearest_retailer_button
    @browser.div(class: 'nearest-retailer').link(class: 'small-btn')
  end

  def calendar
    @browser.ul(class: 'date-selector')
  end

  def calendar_days
    calendar.lis
  end

  def goto_step4
    @browser.div(class: 'submit datetime').link
  end

  def first_name
    @browser.text_field(id: 'firstname')
  end

  def last_name
    @browser.text_field(id: 'lastname')
  end

  def step4_town
    @browser.text_field(id: 'towncity')
  end

  def address_line_1
    @browser.text_field(id: 'addressline1')
  end

  def step4_postcode
    @browser.text_field(id: 'contactpostcode')
  end

  def house_number
    @browser.text_field(id: 'housenumber')
  end

  def email_address
    @browser.text_field(id: 'emailaddress')
  end

  def phone_number
    @browser.text_field(id: 'phonenumber')
  end

  def step4_submit_button
    @browser.div(class: 'submit').button
  end

  def test_drive_confirm
    @browser.link(id: 'test-drive-guide')
  end

  def validation
    @browser.labels(class: 'error')
  end
end
