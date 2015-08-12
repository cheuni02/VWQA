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
        colour.links(:class => "selected").select{|item| item.visible?}
      when "performance"
        performance.links(:class => "selected").select{|item| item.visible?}
      when "transmission"
        transmission.links(:class => "selected").select{|item| item.visible?}
      when "price"
        price.a.click
      else raise
    end
  end

  def summary_option_present?(option)
    basics_item_container.span(:class => option).visible?
  end

  def click_close
    close_buttons = basics_item_container.links(:class => "done-form-item-button")
    close_buttons.each do |close_button|
      if close_button.visible?
        close_button.click
        return
      end
    end
  end

  def select_options(section, option1, option2)
    if section == "price"
      select_min_price(option1)
      select_max_price(option2)
      return
    end
    options = get_section_options(section)
    options.each do |opt|
      if opt.attribute_value("data-inputvalue") == option1 || opt.attribute_value("data-inputvalue") == option2
        opt.click
      end
    end
  end

  def current_section
    basics_item_container.divs(:class => "selected").select{|div| div.visible?}[0].attribute_value("data-formtype")
  end

  def section_expanded?(section)
    basics_item_container.div(:class => section, :class => "completed").exists?
  end

  def click_dont_mind
    basics_item_container.link(:class => "any-form-item-button").click
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

  def select_min_price(min_price)
    price.div(:class => "select-list-min").link(:id => /sbSelector_/).click
    price.div(:class => "select-list-min").ul(:class => "sbOptions").link(:text => min_price).click
  end

  def select_max_price(max_price)
    price.div(:class => "select-list-max").link(:id => /sbSelector_/).click
    price.div(:class => "select-list-max").ul(:class => "sbOptions").link(:text => max_price).click
  end
end
