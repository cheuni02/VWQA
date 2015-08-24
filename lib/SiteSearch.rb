class SiteSearch < BrowserContainer

  def submit_query(text)
    search_box.set(text)
    search_box.send_keys :enter
  end

  def accessory_tab_present?
    accessory_tab.present?
  end

  def pages_tab_present?
    pages_tab.present?
  end

  def cars_tab_present?
    cars_tab.present?
  end

  def retailers_tab_present?
    retailers_tab.present?
  end

  def news_tab_present?
    news_tab.present?
  end

  def get_first_car_header
    first_new_car.h4.text
  end

  def first_car_image_present?
    first_new_car.img.loaded?
  end

  def first_car_info_present?
    first_new_car.link(:class => "more-info").present?
  end

  def first_car_configure_present?
    first_new_car.link(:class => "configure").present?
  end

  def find_link(href)
    search_links.each do |link|
      if link.href =~ /#{href}/i
	return true
      end
    end
    return false
  end

  def check_facets_present
    facet_links.each do |link|
      unless link.present?
        return false
      end
    end
    return true
  end

private

  def search_box
    @browser.text_field(:name => "query")
  end

  def accessory_tab
    @browser.link(:href => /accessorySearch/i)
  end

  def pages_tab
    @browser.link(:href => /newsSearch/i)
  end

  def cars_tab
    @browser.link(:href => /carSearch/i)
  end

  def retailers_tab
    @browser.link(:href => /retailerSearch/i)
  end

  def news_tab
    @browser.link(:href => /newsSearch/i)
  end

  def new_car_panel
    @browser.div(:id => "search-result-cars")
  end

  def first_new_car
    new_car_panel.div(:class => "new-cars")
  end

  def search_links
    @browser.ul(:class => "listing", :index => 0).wait_until_present
    @browser.ul(:class => "listing", :index => 0).links
  end

  def facet_link_parent
    @browser.div(:class => "side-bar").ul
  end

  def facet_links
    facet_link_parent.lis
  end

end
