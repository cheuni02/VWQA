class OrderedCarDashboard < MyVW

  def visit
    visit_page(page_url)
  end

  def login_account_ordered
    get_credentials_ordered
    set_username.set("#{username_ordered}")
    set_password.set("#{password_ordered}")
    click_login_button
  end

  def get_credentials_ordered
    grab_user_cred_ordered
  end

  def set_username
    username_field
  end

  def set_password
    password_box
  end

  def click_login_button
    logon_button.click
  end

  def ordered_car_hero_present
    ordered_car_hero.present?
  end

  def title_present?
    order_status_title.present?
  end

  def title_text
    order_status_title.text
  end

  def ordered_dashboard_section_present?
    ordered_car_hero.present?
    progress_indicator.present?
  end

  def current_step
    current_order_step.text
  end

  def get_ordered_car_step(step_number)
    get_all_ordered_cars.each do |step_num|
      if step_num.a.img.alt == "#{step_number}"
        my_car_url = step_num.link(:index => 0).href
        return my_car_url
      elsif step_num.nil?
        raise
      end
    end
    return nil
  end

  def goto_my_car_url(my_car_url)
    @browser.goto my_car_url
  end

  def refresh_browser_on_step
    @browser.refresh
  end

  private

  def page_url
    "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
  end

  def username_ordered
    @username_user_ordered
  end

  def password_ordered
    @password_user_ordered
  end

  def username_field
    @browser.text_field(:id => "username")
  end

  def password_box
    @browser.text_field(:id => "password")
  end

  def grab_user_cred_ordered
    user_data = File.read('users.json')
    users_hash = JSON.parse(user_data)
    @username_user_ordered = users_hash["User_accounts"]["Users_ordered_car"][0]["Username"]
    @password_user_ordered = users_hash["User_accounts"]["Users_ordered_car"][0]["Password"]
  end

  def logon_button
    @browser.button(:id => 'login-button')
  end

  def ordered_car_hero
    @browser.section(:class => "ordered-car-hero--step-04")
  end

  def progress_indicator
    @browser.div(:class => "parallax-hero__steps")
  end

  def order_status_title
    @browser.div(:class => "parallax-hero__content").h1(:class => "parallax-hero__title")
  end

  def step_passed
    @browser.div(:class => "parallax-hero__steps")
  end

  def current_order_step
    @browser.li(:class => "parallax-hero__step--active")
  end

  def get_all_ordered_cars
    @browser.execute_script('return document.getElementsByClassName("status-ordered-car")')
  end

end
