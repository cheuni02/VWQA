class WarningLights < Owners

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    warning_lights_all.wait_until_present(10)
  end

  def get_lights(colour)
    case(colour)
      when "Red"
        lights = red_lights
      when "Yellow"
        lights = yellow_lights
      when "Green"
        lights = green_lights
      else lights = all_lights
    end

    return lights
  end

  def click_colour(colour)
    case(colour)
      when "Red"
        red_button.click
      when "Yellow"
        yellow_button.click
      when "Green"
        green_button.click
      else all_button.click
    end
  end

  def click_light(light)
    light.link.click
  end

  def get_title
    page_title.text
  end

  private

  def page_url
    "/owners/warning-lights"
  end

  def warning_lights_all
    @browser.div(:id => "warning-lights")
  end

  def all_button
    @browser.ul(:id => "button-toggle").li(:id => "all")
  end

  def red_button
    @browser.ul(:id => "button-toggle").li(:id => "red")
  end

  def yellow_button
    @browser.ul(:id => "button-toggle").li(:id => "yellow")
  end

  def green_button
    @browser.ul(:id => "button-toggle").li(:id => "green")
  end

  def red_lights
    @browser.ul(:id => "red-lights").lis
  end

  def yellow_lights
    @browser.ul(:id => "yellow-lights").lis
  end

  def green_lights
    @browser.ul(:id => "green-lights").lis
  end

  def page_title
    @browser.div(:id => "page").div(:class => "grid-6").h1
  end


end
