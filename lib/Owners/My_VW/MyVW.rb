class MyVW < BrowserContainer
  include CommonNav

  def register
    MyVWRegister.new(@browser)
  end

  def login
    MyVWLogin.new(@browser)
  end

  def profile
    MyVWProfile.new(@browser)
  end

  def add_car
    MyVWAddCar.new(@browser)
  end

  def my_configurations
    MyVWConfigs.new(@browser)
  end

  def primary_nav
    CommonNav::PrimaryNav.new(@browser)
  end

  def current_car_dashboard
    CurrentCarDashbaord.new(@browser)
  end

  def ordered_car_dashboard
    OrderedCarDashbaord.new(@browser)
  end

end
