class Accessories < Owners

  def visit
    visit_page(page_url)
  end

  def visit_search
    visit_page(page_search_url)
  end

  def main_loaded?
    accessories_main.present?
  end

  def view_all_accessories
    main_page_links.each do |link|
      if link.h2.text =~ /accessories/i
	link.click
	break
      end
    end
  end

  def filter_options_present?
    find_accessory_field.present?
  end

  def find_accessory(query)
    find_accessory_field.set(query)
    find_accessory_field.send_keys :enter
    #self.find_accessory_search
  end

  def find_accessory_search
    #find_accessory_form.submit
  end

  def get_search_results
    results = []
    accessories_results.each do |accessory|
      results.push(accessory.h4.text)
    end

    return results
  end

  def set_filter_model(model)
    model_select.select(model)
  end

  def set_filter_year(year)
    model_year_select.select(year)
  end

  def filter_search
    filter_search_button.click
  end

  def set_location(location)
    location_search_field.set(location)
  end

  def search_location
    location_search_button.click
  end

  def retailer_panel_present?
    retailer_panel.when_present.div(:class => "retailer").present?
  end

  def set_filter_category(category)
    filter_category.select(/#{category}/i)
  end

  def click_first_accessory
    accessories_results.first.link.click
  end

  def accessory_title_present?
    accessory_details.when_present.h2.present?
  end

  def accessory_image_present?
    accessory_details.when_present.img.loaded?
  end

  def accessory_desc_present?
    accessory_details.when_present.div(:class => "description").present?
  end

  private

  def page_url
    "/owners/accessories-and-merchandise"
  end

  def page_search_url
    "/owners/accessories/all/all/all/none/1"
  end

  def accessories_main
    #@browser.image(:alt => "Accessories and Merchandise")
    @browser.image(:alt => "accessories")
  end

  def main_page_links
    @browser.links(:class => "url")
  end

  def find_accessory_field
    @browser.text_field(:id => "accessory-search")
  end

  def find_accessory_form
    @browser.form(:action => "/owners/accessories/")
  end

  def filter_category
    @browser.select(:id => "category-search")
  end

  def model_select
    @browser.select(:id => "model-search")
  end

  def model_year_select
    @browser.select(:id => "year-filter")
  end

  def accessories_results
    @browser.div(:id => "accessories").divs(:class => "accessory")
  end

  def filter_search_button
    @browser.div(:id => "model-year-filter").input(:class => "submit")
  end

  def location_search_field
    @browser.text_field(:id => "find-retailer-search-text")
  end

  def location_search_button
    @browser.input(:id => "find-retailer-search-submit")
  end

  def retailer_panel
    @browser.div(:id => "retailers-search-results")
  end

  def accessory_details
    @browser.div(:id => "details")
  end
end
