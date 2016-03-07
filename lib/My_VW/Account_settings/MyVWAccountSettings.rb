class MyVWAccountSettings < MyVW
  def visit
    visit_page(page_url)
  end

  def account_settings_page_present?
    my_account_title.present?
  end

  def get_car_type(type)
    get_user_car_list.each do |car_type|
      if car_type.div(class: 'logged-user-car-list__item-text').h4.text == "#{type}"
        my_thumbnail = car_type.div(class: 'logged-user-car-list__item-picture').img.src
        return my_thumbnail
      elsif car_type.nil?
        fail
      end
    end
    nil
  end

  def thumbnail_url(thumbnail)
    'http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/%s.jpg' % [thumbnail]
  end

  def page_url
    '/owners/my/account/index'
  end

  def my_account_title
    @browser.h1(class: 'full-hero__title')
  end

  # Personal details form

  def personal_details
    @browser.div(class: 'my-car-form__window').h2(text: 'Personal details')
  end

  def title
    @browser.text_field(id: 'title')
  end

  def first_name
    @browser.text_field(id: 'firstName')
  end

  def last_name
    @browser.text_field(id: 'surname')
  end

  def home_number
    @browser.text_field(id: 'phone')
  end

  def mobile_number
    @browser.text_field(id: 'mobile')
  end

  def work_phone
    @browser.text_field(id: 'workphone')
  end

  def date_of_birth_day
    @browser.text_field(id: 'dateOfBirth_day')
  end

  def date_of_birth_month
    @browser.select(id: 'dateOfBirth_month')
  end

  def date_of_birth_year
    @browser.select(id: 'dateOfBirth_year')
  end

  def save_personal_details
    @browser.button(id: 'save-personal-details')
  end

  def personal_details_text
    @browser.div(id: 'personal-details-text').span(class: 'fa fa-edit')
  end

  def personal_details_edit
    @browser.div(id: 'personal-details-edit').span(class: 'fa fa-close')
  end

  def personal_details_view_mode
    @browser.div(id: 'personal-details-text').style 'display'
  end

  def personal_details_edit_mode
    @browser.div(id: 'personal-details-edit').style 'display'
  end

  def name_value
    @browser.span(id: 'name-value').text.split(/\s/)
  end

  def home_phone_value
    @browser.span(id: 'homePhone-value').text
  end

  def mobile_phone_value
    @browser.span(id: 'mobilePhone-value').text
  end

  def work_phone_value
    @browser.span(id: 'workPhone-value').text
  end

  def date_of_birth_value
    @browser.span(id: 'dateOfBirth-value').text
  end

  def get_personal_details_fields
    list = []
    @browser.div(id: 'personal-details-text').ul(class: 'my-car-form__summary my-personal-details_summary-collapsed')
      .lis.each do |li|
      list.push(li.span(class: 'my-car-form__summary-title').text)
    end
    list
  end

  # Address details form

  def toggle_address_view
    @browser.div(id: 'address-details-toggle')
  end

  def address_details
    @browser.div(class: 'my-car-form__window').h2(text: 'Address details')
  end

  def address_details_view_mode
    @browser.div(id: 'address-details-text').style 'display'
  end

  def address_details_edit_mode
    @browser.div(id: 'address-details-edit').style 'display'
  end

  def house_number_preview
    @browser.span(id: 'houseNumber-value')
  end

  def house_number
    @browser.text_field(id: 'houseNumber')
  end

  def street1_preview
    @browser.span(id: 'street1-value')
  end

  def street1
    @browser.text_field(id: 'street1')
  end

  def street2_preview
    @browser.span(id: 'street2-value')
  end

  def street2
    @browser.text_field(id: 'street2')
  end

  def town_preview
    @browser.span(id: 'town-value')
  end

  def town
    @browser.text_field(id: 'town')
  end

  def county_preview
    @browser.span(id: 'county-value')
  end

  def county
    @browser.text_field(id: 'county')
  end

  def postcode_preview
    @browser.span(id: 'postcode-value')
  end

  def postcode
    @browser.text_field(id: 'postcode')
  end

  def postcode_lookup
    @browser.button(id: 'postcode-lookup')
  end

  def get_address_details_fields
    list = []
    @browser.div(id: 'address-details-text').ul(class: 'my-car-form__summary my-personal-details_summary-collapsed')
      .lis.each do |li|
      list.push(li.span(class: 'my-car-form__summary-title').text)
    end
    list
  end

  # Account settings

  def account_settings
    @browser.div(class: 'my-car-form__window').h2(text: 'Account settings')
  end

  def account_settings_view_mode
    @browser.div(id: 'account-settings-text').style 'display'
  end

  def account_settings_edit_mode
    @browser.div(id: 'account-settings-edit').style 'display'
  end

  def email_field
    @browser.span(id: 'email-text').span(class: 'my-car-form__summary-title').text
  end

  def password_field
    @browser.span(id: 'password-label-text', class: 'my-car-form__summary-title').text
  end

  def email_value
    @browser.span(id: 'email-text').text.split(/\s/)
  end

  def password_value
    @browser.span(id: 'password-text').text
  end

  # Notifications & preferences

  def notifications_preferences
    @browser.div(class: 'my-car-form__window').h2(text: 'Notifications & Preferences')
  end

  def car_settings
    @browser.div(class: 'col-12').h2(text: 'Car settings')
  end

  def get_user_car_list
    @browser.execute_script('return document.getElementsByClassName("col-6 logged-user-car-list__item")')
  end

  def car_type_name
    @browser.div(class: 'logged-user-car-list__item-text').h4
  end
end
