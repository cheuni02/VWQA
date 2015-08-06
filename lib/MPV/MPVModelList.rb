class MPVModelList < Mpv
	
  def page_loaded?
    model_list.wait_until_present(10)
  end

  private

  def model_list
    @browser.div(:class => 'model-items')
  end

end