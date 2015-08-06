class ServicePromise < Servicing  

  def visit
   visit_page(page_url)
  end
  
  def page_loaded?
    promise_list.present?
  end

  def get_links
    promise_headers
  end

  def get_promises
    promises_content
  end

  def click_link(link)  
    @arr = get_links  
    @arr[link.to_i-1].click
  end

  def check_promise(promise, link)
    @promises = get_promises    
    @promises[link.to_i-1].h2.text.include?(promise)
  end
  
  private 
  
  def page_url
    "/owners/service-promise"
  end
  
  def promise_list
    @browser.ol(:class => "tabbed-content-list")
  end

  def promise_headers
    @browser.li(:class => "tabbed-content-headings").ul.lis
  end

  def promises_content
    @browser.ul(:class => 'tabbed-content tabbed').lis(:class => "tab-content")
  end

  

end