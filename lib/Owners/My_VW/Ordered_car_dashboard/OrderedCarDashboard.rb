class OrderedCarDashbaord < MyVW

  def visit
    visit_page(page_url)
  end

  def ordered_dashboard_section
    progress_indicator.present?
    ordered_car_hero.present?
    end

  def ordered_car_hero_present
  ordered_car_hero.present?

  def title_present
  order_status_title.present?
  end

  def title_text
    order_status_title.text
  end


  def go_to_ordered_car_dash
    my_cars.when_present.hover
    ordered_car_golf.when_present.click
    ordered_car_hero.wait_until_present
  end

  def ordered_dashboard_section
    ordered_car_hero.present?
    progress_indicator.present?
  end


  private

   def page_url
    "/vw-authentication/login/auth?targetUrl=/owners/my/cars"
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

   def my_cars
     @browser.ul(:class => "welcome-stripe__menu-list", :index =>1).li(:class => "welcome-stripe__menu-list-item").a(:href => "#")
   end


  def ordered_car_golf
    @browser.img(:alt => "OrderedGolf")
  end

  def step_passed
  @browser.div(:class => "parallax-hero__steps")
  end

  end
  end