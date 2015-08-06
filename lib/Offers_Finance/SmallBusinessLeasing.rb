class SmallBusinessLeasing < OffersFinance

  def visit
    visit_page(page_url)
  end

  def page_loaded?
    filter_options.present?
  end
  
  def count_displayed_cars
    count = 0
    cars_list.each do |car|
      count += 1 if car.present?
    end
    
    return count
  end
  
  def click_filter(name)
    get_filter(name).click
  end
  
  def view_car_quotations(model)
    cars_list.each do |car|
      if car.h2.text =~ /#{model}/i
	car.link.click
	break
      end
    end
  end
  
  def quotation_panel_present?
    quotation_panel.wait_until_present
  end
  
  def check_quotation_data
    errors = []
    quotation_panel.ul(:class => "offers-model-data").when_present do
      done = false
      index = 0
      pIndex = 0
      until done
	quotation_panel.ul(:class => "offers-model-data").table.tds.each do |data|
	  if (index % 3) == 0
	    errors.push("Missing Trim Data at Cell #{index}, page #{pIndex}") if data.text == ""
	  elsif (index % 3) == 1
	    errors.push("Missing Engine Data at Cell #{index} page #{pIndex}") if data.text == ""
	  else
	    errors.push("Missing Price Data at Cell #{index} page #{pIndex}") if data.span.text == ""
	    errors.push("Missing Quote Link at Cell #{index} page #{pIndex}") unless data.link.present?
	  end
	  index += 1
	end
	
	if !(quotation_panel_next.present?)
	  done = true
	else
	  quotation_panel_next.when_present.click
	  pIndex += 1
	  quotation_panel.ul(:class => "offers-model-data").wait_until_present
	end
    end
  end
  
  return errors
  end

  def get_title_count
    quotation_panel_data.when_present.span.text.to_i
  end

  def count_table_rows
    rows = 0
    done = false
    until done do
      quotation_panel_data.wait_until_present
      rows += (quotation_panel_data.trs.length - 1)
      if quotation_panel_next.present?
	quotation_panel_next.click
	sleep(2)
      else
	done = true
      end
    end
    
    return rows
  end
  
  def click_random_view_quote
    links = quotation_panel_data.links(:text => "Get a quote")
    links[rand(links.length)].click
  end

  private
  
  def page_url
    "/buying-guide/small-business/contract-hire-offers"
  end
  
  def filter_options
    @browser.div(:id => "small-business-filter")
  end
  
  def cars_list
    @browser.ul(:id => "contract-hire-cars").lis
  end
  
  def get_filter(id)
    @browser.checkbox(:id => /#{id}/i)
  end
    
  def quotation_panel
    @browser.div(:id => "offers-table")
  end
  
  def quotation_panel_next
    @browser.link(:class => "next")
  end
  
  def quotation_panel_data
    @browser.ul(:class => "offers-model-data")
  end






end 