class FleetRequestADemo < Fleet
  def visit
    visit_page(page_url)
  end

  def demo_nav_section_present?
    nav_section.present?
  end

  def demo_form_section_present?
    form_section.present?
  end

  def demo_request_title_text
    section_title_request.text
  end

  def demo_company_name_input
    demo_company_name
  end

  def click_submit_button
    submit_button.click
  end

  def set_company_name(value)
    company_name.set(value)
  end

  def set_title_field(value)
    title_field.select(/#{value}/i)
  end

  def set_first_name(value)
    first_name.set(value)
  end

  def set_surname(value)
    surname.set(value)
  end

  def set_email(value)
    email.set(value)
  end

  def set_job_title(value)
    job_title.set(value)
  end

  def set_telephone(value)
    telephone.set(value)
  end

  def set_fleet_size(value)
    fleet_size(value).set
  end

  def set_car_field(value)
    car_field.select(/#{value}/i)
  end

  def set_preferred_date(value)
    date = DateTime.now
    case value
    when 'yesterday'
      preferred_date.set(date.prev_day.strftime '%d/%m/%Y')
    when 'today'
      preferred_date.set(date.strftime '%d/%m/%Y')
    when 'tomorrow'
      preferred_date.set(date.next_day.strftime '%d/%m/%Y')
    when 'nextmonth'
      preferred_date.set(date.next_month.strftime '%d/%m/%Y')
    when 'nextyear'
      preferred_date.set(date.next_year.strftime '%d/%m/%Y')
    else
      preferred_date.set('')
    end
  end

  def set_additional_info(value)
    additional_info.set(value)
  end

  def set_email_information(value)
    if value == 'yes'
      email_information.set
    elsif value == 'no'
      email_information.clear
    end
  end

  def set_telephone_information(value)
    if value == 'yes'
      telephone_information.set
    elsif value == 'no'
      telephone_information.clear
    end
  end

  def set_text_msg_info(value)
    if value == 'yes'
      text_msg_info.set
    elsif value == 'no'
      text_msg_info.clear
    end
  end

  def set_post_information(value)
    if value == 'yes'
      post_information.set
    elsif value == 'no'
      post_information.clear
    end
  end

  def set_not_hear_information(value)
    if value == 'yes'
      not_hear_information.set
    elsif value == 'no'
      not_hear_information.clear
    end
  end

  def demo_complete_status(page)
    title = get_browser_title
    case page
    when 'Thank you'
      fail AssertionError, "Request a demo - Thank you page has not been loaded. Actual page: #{title}" unless title == 'Your Request : Volkswagen UK'
    when 'Request Form'
      fail AssertionError, "Request a demo landing page should be displayed. Actual page: #{title}" unless title == 'Request a demo : Volkswagen UK'
    end
  end

  def privacy_policy_mouse_hover
    privacy_policy.hover
  end

  def privacy_content_popup_present?
    privacy_content_popup.wait_until_present
    privacy_content_popup.present?
  end

  def company_name_error_msg_p?
    company_name_error.present?
  end

  def first_name_error_msg_p?
    first_name_error.present?
  end

  def surname_error_msg_p?
    surname_error.present?
  end

  def email_error_msg_p?
    email_error.present?
  end

  def telephone_error_msg_p?
    telephone_error.present?
  end

  def job_title_error_msg_p?
    job_title_error.present?
  end

  private

  def page_url
    '/fleet/request-demo/'
  end

  def section_title_request
    @browser.div(class: /.+(requestDemo)\z/).h1
  end

  def nav_section
    @browser.div(id: 'section-nav')
  end

  def form_section
    @browser.div(id: 'requestDemo')
  end

  #--------------Form-------------
  def company_name
    @browser.text_field(id: 'companyName')
  end

  def company_name_error
    v = company_name.parent
    v.p(class: 'form-error')
  end

  def title_field
    @browser.select(id: 'title')
  end

  def first_name
    @browser.text_field(id: 'firstName')
  end

  def first_name_error
    v = first_name.parent
    v.p(class: 'form-error')
  end

  def surname
    @browser.text_field(id: 'surname')
  end

  def surname_error
    v = surname.parent
    v.p(class: 'form-error')
  end

  def email
    @browser.text_field(id: 'email')
  end

  def email_error
    v = email.parent
    v.p(class: 'form-error')
  end

  def telephone
    @browser.text_field(id: 'telephone')
  end

  def telephone_error
    v = telephone.parent
    v.p(class: 'form-error')
  end

  def job_title
    @browser.text_field(id: 'jobTitle')
  end

  def job_title_error
    v = job_title.parent
    v.p(class: 'form-error')
  end

  def fleet_size(size)
    s = @browser.div(class: 'form-row form-row-checkboxes')
    s.radio(value: /#{size}/)
  end

  def car_field
    @browser.select(id: 'car')
  end

  def preferred_date
    @browser.text_field(id: 'preferred-date')
  end

  def additional_info
    @browser.textarea(id: 'additionalComment')
  end

  def email_information
    @browser.checkbox(id: 'email-opt-in')
  end

  def telephone_information
    @browser.checkbox(id: 'phone-opt-in')
  end

  def text_msg_info
    @browser.checkbox(id: 'text-msg-opt-in')
  end

  def post_information
    @browser.checkbox(id: 'post-opt-in')
  end

  def not_hear_information
    @browser.checkbox(id: 'vw-and-assoc')
  end

  def privacy_policy
    @browser.link(class: 'show-pop-up-content', href: '#')
  end

  def privacy_content_popup
    @browser.div(class: 'privacy-content')
  end

  def submit_button
    @browser.button(name: 'submit')
  end

  def request_success
    @browser.div(class: /.+(success)/).em
  end
end
