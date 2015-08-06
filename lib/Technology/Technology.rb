class Technology < BrowserContainer

  def glossary
    Glossary.new(@browser)
  end

  def page_loaded?
    video.wait_until_present
  end

  def get_browser_title
    browser_title
  end

  def browser_title
    @browser.title
  end

  def visit
    visit_page(page_url)
  end

  def page_url
    "/technology"
  end

  def video_present
    video.present?
  end

  def thinkblue
    ThinkBlue.new(@browser)
  end

  def thinkblue_link
    #@browser.span(:text => "Think Blue.")
    @browser.li(:class => "vw-btn", :index => 1).link
  end

  def thinkblue_link
    thinkblue_link.click
  end

  def technology_navigation_link(link)
    technology_nav_section.link(:href, /#{link}/)
  end

  def technology_nav_section
    @browser.div(:id => 'section-nav')
  end

  def click_technology_navigation_link(link)
    technology_navigation_link(link).wait_until_present(15)
    technology_navigation_link(link).click
  end

  def video
    @browser.div(:class => 'youtube-player')
  end

  def check_all_sections?

    links.each do |element|
       raise unless element.present?
        # print element.present?
      end
  end

  def check_content_in_all_sections?

    links.each do |link|
      technology_sections_content(link).each do |element|
        raise unless element.present?
         # print element.present?
      end
    end

  end

  def technology_page_div
    @browser.div(:class => 'grid-row', :index => 1)
  end

  def links
    @links = Array.new
    @links[0] = made_for_life
    @links[1] = auto_rain_sensors
    @links[2] = lane_assist
    @links[3] = light_systems
    @links[4] = electronic_stability_control
    @links[5] = park_assist
    @links[6] = parking_sensors
    @links[7] = child_safety
    @links[8] = electric_door_mirrors
    @links[9] = city_emergency_braking
    @links[10] = rear_view_camera
    @links[11] = adaptive_cruise_control
    return @links
  end

  def made_for_life
    technology_page_div.link(:href => '/about-us/bus?int=4_cinema_ident')
  end

  def auto_rain_sensors
    technology_page_div.link(:class => 'url', :href =>  '/technology/comfort-and-convenience/auto-rain-sensors')
  end

  def lane_assist
    technology_page_div.link(:class => 'url',:href => '/technology/proximity-sensing/lane-assist')
  end

  def light_systems
    technology_page_div.link(:class => 'url',:href => '/technology/visibility-and-security/light-systems')
  end

  def electronic_stability_control
    technology_page_div.link(:class => 'url',:href =>'/technology/braking-and-stability-systems/esc')
  end

  def park_assist
    technology_page_div.link(:class => 'url',:href =>'/technology/parking-and-manoeuvring/park-assist')
  end

  def parking_sensors
    technology_page_div.link(:class => 'url',:href =>'/technology/parking-and-manoeuvring/parking-sensors')
  end

  def child_safety
    technology_page_div.link(:class => 'url',:href =>'/technology/passive-safety/child-safety')
  end

  def electric_door_mirrors
    technology_page_div.link(:class => 'url',:href =>'/technology/comfort-and-convenience/electric-door-mirrors')
  end

  def city_emergency_braking
    technology_page_div.link(:class => 'url',:href =>'/technology/braking-and-stability-systems/city-emergency-braking')
  end

  def rear_view_camera
    technology_page_div.link(:class => 'url',:href =>'/technology/parking-and-manoeuvring/rear-view-camera')
  end

  def adaptive_cruise_control
    technology_page_div.link(:class => 'url',:href =>'/technology/adaptive-cruise-control-acc')
  end

  def technology_sections_content(section)
    @content = Array.new
    @content[0] = section.div.img
    @content[1] = section.div.h2
    @content[2] = section.div.p
    @content[3] = section.div.p(:index =>1)
    return @content
  end

end
