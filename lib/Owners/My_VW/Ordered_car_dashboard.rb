require 'yaml'
class OrderedCarDashbaord < MyVW

  def visit
    visit_page(page_url)
  end

  # def login_valid_account
  #   get_credentials_valid
  #   set_username.set("#{username_valid}")
  #   set_password.set("#{password_valid}")
  #   click_login_button
  # end
  #
  # def login_unvalidated_account
  #   get_credentials_unvalidated
  #   set_username.set("#{username_unvalidated}")
  #   set_password.set("#{password_unvalidated}")
  #   click_login_button
  # end
  #
  # def get_credentials_valid
  #   grab_user_cred_valid
  # end

  private

  def page_url
    "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
  end

  def page_hero
    @browser.section (:class => "ordered-car-hero")
  end

def step_passed
   @browser.
end