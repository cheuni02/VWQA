class MPVBasics < Mpv

  def basics_page_loaded?
    basics_item_container.wait_until_present(10)
  end

  def item_list
    basics_items
  end

  def visit_basics
    visit_page_mpv(default_url)
  end

  def get_section_options(section)
    case section
      when "bodystyle"
        section_object = body_style.div(:class => 'form-item-expand opaque-block').links
      when "color"
        section_object = colour.div(:class => 'form-item-expand opaque-block').links
      when "performance"
        section_object = performance.div(:class => 'form-item-expand opaque-block').links
      when "transmission"
        section_object = transmission.div(:class => 'form-item-expand opaque-block').links
      when "price"
        section_object = price.div(:class => 'form-item-expand opaque-block').options
      else raise
    end

    return section_object
  end

  def get_footer(section)
    case section
      when "bodystyle"
        section_object = body_style
      when "color"
        section_object = colour
      when "performance"
        section_object = performance
      when "transmission"
        section_object = transmission
      when "price"
        section_object = price
      else raise
    end

    return section_object.div(:class => 'form-item-expand-controls').links
  end

  def open_section(section)
    basics_item_container.wait_until_present

    case section
      when "bodystyle"
        body_style.a.click
      when "color"
        colour.a.click
      when "performance"
        performance.a.click
      when "transmission"
        transmission.a.click
      when "price"
        price.a.click
      else raise
    end
  end

  def get_selected_items(section)
    case section
      when "bodystyle"
        body_style.links(:class => "selected").select{|item| item.visible?}
      when "color"
        colour.a.click
      when "performance"
        performance.a.click
      when "transmission"
        transmission.a.click
      when "price"
        price.a.click
      else raise
    end
  end


  private

  def default_url
    "/perfect/app#/basics?&transmission=any&body=any&color=any&price=any&performance=any&models=any"
  end

  def basics_item_container
    @browser.div(:class => 'basics-form-items')
  end

  def basics_items
    basics_item_container.divs(:class => 'basics-form-item')
  end

  def body_style
    basics_item_container.div(:class => "size")
  end

  def colour
    basics_item_container.div(:class => "color")
  end

  def performance
    basics_item_container.div(:class => "performance")
  end

  def transmission
    basics_item_container.div(:class => "transmission")
  end

  def price
    basics_item_container.div(:class => "price")
  end

end
