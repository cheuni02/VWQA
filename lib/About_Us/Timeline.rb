class Timeline < AboutUs

  def visit
    visit_page(page_url)
  end

  def set_list_view
    list_view_link.click
  end

  def set_timeline_view
    timeline_view_link.click
  end

  def get_list
    list_view_items
  end

  def timeline_present?
    timeline_view_container.present?
  end

  def set_search_term(search_term)
    search_input.set(search_term)
  end

  def start_search
    search_button.click
  end

  def set_decade(decade)
    decade_button(decade).click
  end

  def search_page(search_term)
    arr = list_view_items
    arr.each do |item|
      search_term.each do |term|
        if item.text.include? term.to_s
          return true
        end
      end
    end

    return false
  end

  def get_dates
    year_divs
  end

  def get_year_text(year)
    year_div_title(year)
  end

  def check_dates(decade)
    arr = get_dates
    arr.each do |year|
      if (get_year_text(year).text.to_i > decade.to_i + 9)
        return false
      end
    end

    return true
  end

  private

  def page_url
    "/timeline/index"
  end

  def list_view_link
    @browser.link(:id => "tl-toggle-list")
  end

  def timeline_view_link
    @browser.link(:id => "tl-toggle-timeline")
  end

  def list_view_items
    @browser.div(:id => "tl-view", :class => "list").divs(:class => "event")
  end

  def timeline_view_container
    @browser.div(:id => "tl-view", :class => "timeline")
  end

  def search_input
    @browser.form(:id => "timeline-search-form").text_field(:class => "ac_input")
  end

  def search_button
    @browser.form(:id => "timeline-search-form").input(:type => "submit")
  end

  def decade_button(decade)
    @browser.div(:id => "tl-jump").link(:href => /decade=#{decade}/)
  end

  def year_divs
    @browser.div(:class => "years").divs(:class => "year")
  end

  def year_div_title(year)
    year.div(:class => "title")
  end

end
