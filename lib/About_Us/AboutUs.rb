class AboutUs < BrowserContainer

  def timeline
    Timeline.new(@browser)
  end

  def well_worth_it
    Well_worth_it.new(@browser)
  end
end
