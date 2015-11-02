class BookAService2Step5 < BookAService2

  def wait_for_page
    date_table.wait_until_present
  end

  def select_date_available
    date_first_available.when_present.click
  end

  def date_active?
    active_date.present?
  end

  def get_calender_month
    current_month.text
  end

  def click_next_month
    next_month.when_present.click
  end

  def get_convieneance_options_list
    arr = []
    convieneance_options_headers.each do |header|
      arr.push(header.text)
    end
    return arr
  end

  def click_step_6_button
    step6_button.when_present.click
  end

  def set_manual_collection_address
    manual_collection_switch.when_present.click
  end

  def manual_collection_form_present?
    manual_collection_entry_form.wait_until_present(10)
  end

  def set_manual_delivery_address
    manual_delivery_switch.when_present.click
  end

  def manual_delivery_form_present?
    manual_delivery_entry_form.wait_until_present(10)
  end

  def set_booking_time(time)
    booking_time_set(time)
  end

  def select_convieneance_option(option)
    convieneance_options_items.each do |item|
      if item.text =~ /#{option}/i
        item.click
        break
      end
    end
  end


  private


  def date_table
    @browser.div(:class => "datepicker-days").table
  end

  def current_month
    date_table.th(:class => "datepicker-switch")
  end

  def next_month
    date_table.th(:class => "next chevron")
  end

  def date_first_available
    date_table.tds(:class => 'day new').first
  end

  def active_date
    date_table.td(:class => "active")
  end

  def convieneance_options
    @browser.div(:id => "book-a-service-convenience-options")
  end

  def convieneance_options_headers
    convieneance_options.h3s
  end

  def convieneance_options_items
    convieneance_options.labels
  end

  def step6_button
    @browser.button(:id => "goto-review-selection")
  end

  def manual_collection_switch
    @browser.label(:for => "useCollectionAddress")
  end

  def manual_delivery_switch
    @browser.label(:for => "useDeliveryAddress")
  end

  def manual_collection_entry_form
    @browser.div(:id => "book-service-collection-address")
  end

  def manual_delivery_entry_form
    @browser.div(:id => "book-service-return-address")
  end

  def booking_time_set(value)
    @browser.execute_script("document.getElementsByClassName('my-selectbox__input ui-autocomplete-input')[1].value='#{value}'")
  end


end
