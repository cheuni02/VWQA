class VWDogs < SpecialPages
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    dogs_panel.present?
  end

  def set_view_cars
    view_toggle.link(class: 'car').click
  end

  def set_view_dogs
    view_toggle.link(class: 'dog').click
  end

  def get_range_content
    arr = []
    content = dogs_panel.lis.select(&:present?)

    content.each do |li|
      arr.push([li.link.h2.text, li.div(class: 'dog-range').img.loaded?])
    end

    arr
  end

  def select_first_dog
    dogs_panel.when_present.lis.first.link.click
  end

  def set_dog_filter(value)
    dog_filter.select(/#{value}/i)
  end

  def more_info_link_present?
    first_dog_info_panel.when_present.link(text: /More Information/i).present?
  end

  def vw_news_link_present?
    first_dog_info_panel.when_present.link(text: /Volkswagen News/i).present?
  end

  private

  def page_url
    '/dogs'
  end

  def dogs_panel
    @browser.div(id: 'range')
  end

  def view_toggle
    @browser.div(class: 'car-dog-toggle')
  end

  def first_dog_info_panel
    @browser.div(class: 'information-area', index: 0)
  end

  def dog_filter
    @browser.select(id: 'range-sort')
  end
end
