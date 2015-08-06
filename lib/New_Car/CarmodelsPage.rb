class CarModelsPage < NewCars

  def visit(model = "up-nf")
    visit_page(page_url(model))
  end

  def page_loaded?
    model_selection.present?
  end

  def get_model(model, trim)
    model_header(model, trim)
  end

  def get_detail_title
    sleep(1)
    title_details_section.text
  end

  def get_comp_table_title
    comp_table_title
  end

  def next_button_click
    next_button.click
  end

  def click_table_section(section)
    table_section(section).link.click
  end

  def get_section(section)
    table_section_content(section)
  end

  private

  def page_url(model)
    "/new/#{model}/which-model"
  end

  def next_button
    @browser.div(:class => "pagination").link(:class => "next")
  end

  def model_selection
    @browser.div(:id => "carousel-wrapper")
  end

  def model_header(model, trim)
    @browser.link(:href => "/new/#{model}/which-model/#{trim}")
  end

  def title_details_section
    @browser.div(:class => "details-container")
  end

  def comp_table_title
    @browser.div(:class => "compare-models").h3(:class => "highlight")
  end

  def table_section(section)
    @browser.table(:id => section.downcase)
  end

  def table_section_content(section)
    @browser.table(:id => section.downcase).tr(:class => "group-heading")[0]
  end

end