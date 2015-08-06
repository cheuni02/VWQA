class MPVShortlist < Mpv

  def visit_default
    visit_page_mpv(default_url)
  end

  def wait_until_page_loaded
    shortlist_container.wait_until_present
  end

  def show_more_matches
    more_matches_button.click
  end

  def more_matches_present?
    more_matches_container.wait_until_present
  end

  def get_more_matches
    more_matches_items
  end

  def get_shortlisted_cars
    shortlist_items
  end

  def open_details_page(car)
    car.a.click
  end

  def get_name(car)
    car.span(:class => 'shortlist-item-short-name').text
  end

  private

  def default_url
    "/perfect/app#/shortlist#{default_basics}"
  end

  def shortlist_container
    @browser.div(:class => 'shortlist-items')
  end

  def shortlist_items
    shortlist_container.divs(:class => 'shortlist-item')
  end

  def more_matches_button
    @browser.div(:class => 'show-all').a
  end

  def more_matches_container
    @browser.div(:class => 'shortlist-items-more')
  end

  def more_matches_items
    more_matches_container.divs(:class => 'shortlist-item')
  end

end
