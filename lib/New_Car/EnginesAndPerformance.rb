class EnginesAndPerformance < NewCars
  def visit(model)
    visit_page(page_url(model))
  end

  def page_loaded?
    table_overview(true).present?
  end

  def engines_models_section_p?
    engines_models_section.present?
  end

  def select_engines
    engines_models.each do |engine|
      engine.when_present.click
      verify_details_table(engine)
    end
  end

  # This needs improving... Method is way too long and Verbose
  # If you tried to figure out what the heck this was doing youd have a hard time.
  def verify_details_table(engine)
    expand_table_section(table_overview(false))
    is_column_selected?(engine, table_overview(true))
    collapse_table_section(table_overview(true))

    expand_table_section(table_power(false))
    is_column_selected?(engine, table_power(true))
    collapse_table_section(table_power(true))

    expand_table_section(table_torque(false))
    is_column_selected?(engine, table_torque(true))
    collapse_table_section(table_torque(true))

    expand_table_section(table_acceleration(false))
    is_column_selected?(engine, table_acceleration(true))
    collapse_table_section(table_acceleration(true))

    expand_table_section(table_topspeed(false))
    is_column_selected?(engine, table_topspeed(true))
    collapse_table_section(table_topspeed(true))

    expand_table_section(table_fuelconsumption(false))
    is_column_selected?(engine, table_fuelconsumption(true))
    collapse_table_section(table_fuelconsumption(true))

    expand_table_section(table_emissions(false))
    is_column_selected?(engine, table_emissions(true))
    collapse_table_section(table_emissions(true))

    expand_table_section(table_weights(false))
    is_column_selected?(engine, table_weights(true))
    collapse_table_section(table_weights(true))

    expand_table_section(table_towing(false))
    is_column_selected?(engine, table_towing(true))
    collapse_table_section(table_towing(true))
  end

  def get_engine_name(engine)
    name = engine.text
    name.gsub(/\**/, '')
  end

  def get_selected_column_h(section)
    name = selected_column(section).text
    name.gsub(/\**/, '')
  end

  def table_section_selected
    fail AssertionError, 'The Overview section is not expanded' unless table_overview_selected(true).present?
  end

  def expand_table_section(section)
    unless section.tbody.present?
      line = section.link(class: 'expanded-table-title')
      line.click
    end
  end

  def is_column_selected?(engine, section)
    fail AssertionError, 'Column is not selected according to engine' unless get_engine_name(engine) == get_selected_column_h(section)
  end

  def collapse_table_section(section)
    if section.tbody.present?
      line = section.link(class: 'expanded-table-title')
      line.click
    end
  end

  private

  def page_url(model)
    "/new/#{model}/which-model/engines/overview"
  end

  def page_header
    @browser.div(class: 'page-container header')
  end

  def engines_models_section
    @browser.div(class: 'compare-models')
  end

  def engines_models
    engines_models_section.divs(class: 'compare-model-details')
  end

  def engine_name(engine)
    engine.h3
  end

  def table_overview(status)
    if status
      @browser.table(id: 'overview', class: /selected/)
    else
      @browser.table(id: 'overview', class: 'table ftable rounded-top')
    end
  end

  def table_power(status)
    if status
      @browser.table(id: 'power', class: /selected/i)
    else
      @browser.table(id: 'power', class: 'table ftable')
    end
  end

  def table_torque(status) # _selected(status)
    if status
      @browser.table(id: 'torque', class: /selected/i)
    else
      @browser.table(id: 'torque', class: 'table ftable')
    end
  end

  def table_acceleration(status)
    if status
      @browser.table(id: 'acceleration', class: /selected/i)
    else
      @browser.table(id: 'acceleration', class: 'table ftable')
    end
  end

  def table_topspeed(status)
    if status
      @browser.table(id: 'top-speed', class: /selected/i)
    else
      @browser.table(id: 'top-speed', class: 'table ftable')
    end
  end

  def table_fuelconsumption(status)
    if status
      @browser.table(id: 'fuel-consumption', class: /selected/i)
    else
      @browser.table(id: 'fuel-consumption', class: 'table ftable')
    end
  end

  def table_emissions(status)
    if status
      @browser.table(id: 'emissions', class: /selected/i)
    else
      @browser.table(id: 'emissions', class: 'table ftable')
    end
  end

  def table_weights(status)
    if status
      @browser.table(id: 'weights', class: /selected/i)
    else
      @browser.table(id: 'weights', class: 'table ftable')
    end
  end

  def table_towing(status)
    if status
      @browser.table(id: 'towing', class: /selected/i)
    else
      @browser.table(id: 'towing', class: 'table ftable rounded-bottom')
    end
  end

  def selected_column(section)
    section.th(class: 'selected col-1 visible')
  end
end
