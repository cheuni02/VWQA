class ContactUs < BrowserContainer

  def visit
    visit_page(page_url)
  end

  def show_email_panel
    email_panel.click
  end

  def set_title(title)
    title_field.when_present.select(title)
  end

  def set_first_name(first_name)
    first_name_field.when_present.set(first_name)
  end

  def set_surname(surname)
    surname_field.when_present.set(surname)
  end

  def set_telephone(telephone_number)
    telephone_field.when_present.set(telephone_number)
  end

  def set_email(email_address)
    email_field.when_present.set(email_address)
  end

  def set_message(text)
    message_field.when_present.set(text)
  end

  def get_errors
    arr = []
    form_errors.each do |error|
      arr.push(error.text)
    end
    return arr
  end

  def set_retailer_search_name(retailer_name)
    retailer_name_search.set(retailer_name)
  end

  def search_retailer_by_name
    retailer_name_search_button.when_present.click
  end

  def send_message
    email_send_button.when_present.click
  end

  def set_retailer_postcode(postcode)
    retailer_postcode_field.set(postcode)
  end

  def search_by_retailer_location
    retailer_location_search_button.click
  end

  def page_loaded?
    contact_page.present?
  end

  def all_contact_options
    show_all_contact_options.click
  end

  def retailer_search_page
    retailer_location_page.click
  end

  def retailer_search_result
    retailer_map.present?
    retailer_details.present?
  end

  private

  def page_url
    "/about-us/contact"
  end

  def contact_page
    @browser.div(:class => "grid-row ask-volkswagen")
  end

  def email_panel
    @browser.ul(:class => "option-container centered list-unstyled").li(:index => 0).link
  end

  def title_field
    @browser.select(:id => "title")
  end

  def first_name_field
    @browser.text_field(:id => "firstName")
  end

  def surname_field
    @browser.text_field(:id => "lastName")
  end

  def telephone_field
    @browser.text_field(:id => "phone")
  end

  def email_field
    @browser.text_field(:id => "email")
  end

  def message_field
    @browser.textarea(:id => "message")
  end

  def form_errors
    @browser.ps(:class => "form-error")
  end

  def retailer_name_search
    @browser.text_field(:id => "closestTo-all")
  end

  def retailer_name_search_button
    @browser.form(:id => "name-retailer-form").button
  end

  def retailer_postcode_field
    @browser.form(:id => "locationForm-all").text_field(:id => "closestTo-all")
  end

  def email_send_button
    @browser.button(:id => "Send email")
  end

  def retailer_location_search_button
    @browser.section(:id => "show-all-content").wait_until_present
    @browser.button(:id => "search-form-button")
  end

  def show_all_contact_options
    @browser.link(:class => "view-all-link")
  end

  def retailer_location_page
    @browser.section(:id => "show-all-content").wait_until_present
    @browser.section(:id => "show-all-content").section(:class => "table__container").section(:class => "table-cell__left-box").li(:index => 4).link
  end

  def retailer_map
    @browser.figure(:class => "map-retailer--container").section(:class => "map-responsive-helper js-maps-container")
  end 

  def retailer_details
    @browser.figure(:class => "map-retailer--container").figcaption(:class => "map-retailer__details--wrapper")
  end
end