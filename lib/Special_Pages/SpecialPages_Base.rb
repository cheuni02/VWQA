class SpecialPages < BrowserContainer

  def dogs
    VWDogs.new(@browser)
  end

end