class ExplorePage < NewCars

  def visit(model = "up-nf")
    visit_page(page_url(model))
  end

  def page_loaded?
    circle_view_button.present?
  end

  def get_360_arrow
    arrow_360
  end

  def click_360_view
    circle_view_button.click
  end

  def get_360_images
    model_images
  end

  def click_gallery_interior
    interior_4_button.click
  end

  def click_gallery_stylish
    stylish_4_button.click
  end  

  def click_gallery_driving
    driving_4_button.click
  end

  def get_slides(type)
    slides(type)
  end

  def get_current_slide(type)
    current_slide(type)
  end

  private

  def page_url(model = "up-nf")
    "/new/#{model}/explore"
  end

  def circle_view_button
    @browser.link(:class => "view-360")
  end

  def model_images
    @browser.div(:class => "three-sixty").imgs(:class => /frame/i)
  end

  def arrow_360
    @browser.img(:class => "arrows")
  end

  def interior_4_button
    @browser.div(:class => "explore-holder", :index => 0).link(:class => "view-gallery")
  end

  def stylish_4_button
    @browser.div(:class => "explore-holder", :index => 1).link(:class => "view-gallery")
  end

  def driving_4_button
    @browser.div(:class => "explore-holder", :index => 2).link(:class => "view-gallery")
  end

  def slides(type)
    case(type)
      when "interior"
        index = 0
      when "stylish"
        index = 1
      when "driving"
        index = 2
      else raise "Not a valid type"
    end

    return @browser.div(:class => "explore-holder", :index => index).ul(:class => "indicator").lis
  end

  def current_slide(type)
      case(type)
      when "interior"
        index = 0
      when "stylish"
        index = 1
      when "driving"
        index = 2
      else raise "Not a valid type"
    end

    return @browser.div(:class => "explore-holder", :index => index).ul(:class => "indicator").li(:class => "current")
  end


end