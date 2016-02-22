class Fleet < BrowserContainer
  def calculators
    FleetCalculators.new(@browser)
  end

  def managers_guide
    FleetManagersGuide.new(@browser)
  end

  def require_a_demo
    FleetRequestADemo.new(@browser)
  end

  def page_loaded?
    fleet_carousel.wait_until_present
  end

  def click_calc_link
    calcs_link.click
  end

  def visit
    visit_page(page_url)
  end

  def fleet_carousel_present?
    fleet_carousel.present?
  end

  def click_fleet_carousel_next_btn
    fleet_carousel_next_btn.click
  end

  def click_fleet_carousel_prev_btn
    fleet_carousel_previous_btn.click
  end

  def click_fleet_navigation_link(link)
    fleet_navigation_link(link).wait_until_present(15)
    fleet_navigation_link(link).click
  end

  def get_browser_title
    browser_title
  end

  def fleet_team_present?
    fleet_team.present?
  end

  def fleet_team_content_present?
    fleet_sections_content(fleet_team).each do |element|
      fail unless element.present?
    end
  end

  def fleet_news_content_present?
    fleet_sections_content(fleet_newsletter).each do |element|
      fail unless element.present?
    end
  end

  def fleet_manager_present?
    fleet_sections_content(fleet_manager_guides).each do |element|
      fail unless element.present?
    end
  end

  def fleet_tax_guides_present?
    fleet_sections_content(fleet_tax_guide).each do |element|
      fail unless element.present?
    end
  end

  def fleet_emissions_present?
    fleet_sections_content(fleet_emissions_guide).each do |element|
      fail unless element.present?
    end
  end

  def fleet_newsletter_present?
    fleet_newsletter.present?
  end

  def fleet_manager_guides_preset?
    fleet_manager_guides.present?
  end

  def fleet_tax_guide_present?
    fleet_tax_guide.present?
  end

  def fleet_emissions_guide_present?
    fleet_emissions_guide.present?
  end

  def click_fleet_contact
    fleet_team.click
  end

  def click_fleet_manager_guides
    fleet_manager_guides.click
  end

  def switch_to_manager_page
    get_windows.each do |w|
      w.use if w.title == manager_guides_page_name
    end
  end

  private

  def page_url
    '/fleet'
  end

  def calcs_link
    # @browser.span(:text => "Calculators and tools")
    @browser.li(class: 'vw-btn', index: 1).link
  end

  def fleet_carousel
    @browser.div(class: 'slideshow')
  end

  def fleet_carousel_next_btn
    @browser.div(class: 'owl-next')
  end

  def fleet_carousel_previous_btn
    @browser.div(class: 'owl-prev')
  end

  def fleet_nav_section
    @browser.div(id: 'section-nav')
  end

  def fleet_navigation_link(link)
    fleet_nav_section.link(:href, /#{link}/)
  end

  def browser_title
    @browser.title
  end

  def close_window(name)
    @browser.window(title: name).close
  end

  def get_windows
    @browser.windows
  end

  def fleet_page_div
    @browser.div(id: 'page')
  end

  def fleet_team
    fleet_page_div.link(href: 'fleet/contact')
  end

  def fleet_newsletter
    fleet_page_div.link(href: /vw_fleet_news_letter/)
  end

  def fleet_manager_guides
    fleet_page_div.link(href: 'fleet/managers', target: '_blank')
  end

  def manager_guides_page_name
    "Fleet manager's guide : Volkswagen UK"
  end

  def fleet_tax_guide
    fleet_page_div.link(href: /vw_company_car_tax/)
  end

  def fleet_emissions_guide
    fleet_page_div.link(href: /emissions_guide/)
  end

  def fleet_sections_content(section)
    @content = []
    @content[0] = section.div.img
    @content[1] = section.div.h2
    @content[2] = section.div.p
    @content[3] = section.div.p(index: 1)
    @content
  end
end
