class MyVW < VWBase
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

  def my_configurations
    MyVWConfigs.new(@browser)
  end

  def primary_nav
    CommonNav::PrimaryNav.new(@browser)
  end

  def add_current_car
    AddCurrentCarCommon.new(@browser)
  end

  def add_current_car_step_1
    AddCurrentCarStep1.new(@browser)
  end

  def add_current_car_step_2
    AddCurrentCarStep2.new(@browser)
  end

  def add_current_car_step_3
    AddCurrentCarStep3.new(@browser)
  end

  def configured_car_dashboard
    ConfiguredCarDashboard.new(@browser)
  end

  def current_car_dashboard
    CurrentCarDashboard.new(@browser)
  end

  def ordered_car_dashboard
    OrderedCarDashboard.new(@browser)
  end

  def my_vw_api
    MyVWAPI.new
  end

  def delete_car
    DeleteCar.new(@browser)
  end

  def account_settings
    MyVWAccountSettings.new(@browser)
  end

  def forgotten_password
    MyVWForgottenPassword.new(@browser)
  end
end
