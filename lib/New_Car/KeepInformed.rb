class KeepMeInformed < NewCars
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    sign_up_form.present?
  end

  def set_title(title)
    title_field.select(/#{title}/i)
  end

  def set_first_name(name)
    first_name_field.set(name)
  end

  def set_surname(name)
    surname_field.set(name)
  end

  def set_email(email)
    email_field.set(email)
  end

  def submit_form
    submit_button.click
  end

  def submission_complete?
    submission_complete_message.present?
  end

  def set_replacement_month(month)
    replacement_month.select(/#{month}/i)
  end

  def set_replacement_year(year)
    replacement_year.select(year)
  end

  def set_replacement_private
    private_car_radio.set
  end

  def set_replacement_new_car
    new_car_radio.set
  end

  def set_car_make(make)
    car_make_field.set(make)
  end

  def set_car_model(model)
    car_model_field.set(model)
  end

  def opt_in_post
    postal_opt_in.set
  end

  def set_house_number(number)
    house_number_field.set(number)
  end

  def set_postcode(postcode)
    postcode_field.set(postcode)
  end

  def find_postcode
    postcode_search_button.click
    sleep(5)
  end

  private

  def page_url
    '/new/polo-gp/sign-up-form'
  end

  def sign_up_form
    @browser.element(id: 'signUpForm')
  end

  def title_field
    @browser.select(id: 'title')
  end

  def first_name_field
    @browser.text_field(id: 'firstName')
  end

  def surname_field
    @browser.text_field(id: 'lastName')
  end

  def email_field
    @browser.text_field(id: 'email')
  end

  def submit_button
    @browser.button(id: 'submitForm')
  end

  def submission_complete_message
    @browser.div(id: 'showingSignUp')
  end

  def replacement_month
    @browser.select(id: 'nextCarPurchaseMonth')
  end

  def replacement_year
    @browser.select(id: 'nextCarPurchaseYear')
  end

  def private_car_radio
    @browser.radio(id: 'nextCarPurchaseType', index: 0)
  end

  def new_car_radio
    @browser.radio(id: 'nextCarOwnership', index: 0)
  end

  def car_make_field
    @browser.text_field(id: 'currentMake')
  end

  def car_model_field
    @browser.text_field(id: 'currentModel')
  end

  def postal_opt_in
    @browser.checkbox(id: 'optInPostInfo')
  end

  def house_number_field
    @browser.text_field(id: 'houseNumber')
  end

  def postcode_field
    @browser.text_field(id: 'postcode')
  end

  def postcode_search_button
    @browser.link(id: 'findAddress')
  end
end
