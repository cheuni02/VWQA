class ServicePromisePage < ServiceBase

  def page_loaded?
    tabbed_promise_list.wait_until_present(10)
  end






  private

    def tabbed_promise_list
       @browser.ol(:class => "tabbed-content-list")
    end







end
