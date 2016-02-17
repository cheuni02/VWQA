class OrderedCarDashboard < MyVW
  def visit
    visit_page(page_url)
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
        my_car_url = step_num.link(index: 0).href
        return my_car_url
      elsif step_num.nil?
        fail
      end
    end
    nil
  end

  def goto_my_car_url(my_car_url)
    @browser.goto my_car_url
  end

  def refresh_browser_on_step
    @browser.refresh
  end

  private

  def page_url
    '/vw-authentication/login/auth?targetUrl=/owners/my/cars'
  end

  def ordered_car_hero
    @browser.section(class: 'ordered-car-hero--step-04')
  end

  def progress_indicator
    @browser.div(class: 'parallax-hero__steps')
  end

  def order_status_title
    @browser.div(class: 'parallax-hero__content').h1(class: 'parallax-hero__title')
  end

  def step_passed
    @browser.div(class: 'parallax-hero__steps')
  end

  def current_order_step
    @browser.li(class: 'parallax-hero__step--active')
  end

  def get_all_ordered_cars
    @browser.execute_script('return document.getElementsByClassName("status-ordered-car")')
  end
end
