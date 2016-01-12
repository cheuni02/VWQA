class MyAccount < MyVW

  def visit
    visit_page(page_url)
  end

  def my_account_page_present?
    my_profile_title.present?
  end

  def get_car_type(type)
    get_user_car_list.each do |car_type|
    if car_type.div(:class => "logged-user-car-list__item-text").h4.text == "#{type}"
      my_thumbnail = car_type.div(:class => "logged-user-car-list__item-picture").img.src
      return my_thumbnail
     elsif car_type.nil?
      raise
    end
  end
  return nil
  end

  def thumbnail_url(thumbnail)
    "http://www.volkswagen.co.uk/assets/content/mobile/thumbnails/%s.jpg" % [thumbnail]
  end

  private

  def page_url
    "/owners/my/account/index"
  end

  def my_profile_title
    @browser.h1(:class => "full-hero__title")
  end

  def personal_details
    @browser.div(:class => "my-car-form__window").h2(:text => "Personal details")
  end

  def address_details
    @browser.div(:class => "my-car-form__window").h2(:text => "Address details")
  end

  def account_settings
    @browser.div(:class => "my-car-form__window").h2(:text => "Account settings")
  end

  def notifications_preferences
    @browser.div(:class => "my-car-form__window").h2(:text => "Notifications & Preferences")
  end

  def car_settings
    @browser.div(:class => "col-12").h2(:text => "Car settings")
  end

  def get_user_car_list
    @browser.execute_script('return document.getElementsByClassName("col-6 logged-user-car-list__item")')
  end

  def car_type_name
    @browser.div(:class => "logged-user-car-list__item-text").h4
  end
end