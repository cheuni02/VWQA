require 'rest-client'

class MyVWAPI < MyVW
  def initialize
    headers = {
      :content_type => 'application/json',
      :accept => 'application/json',
      :'x-access-username' => 'test_client',
      :'x-access-password' => 'Manuela1999'
    }

    @user_api = RestClient::Resource.new("https://#{get_sb_host}/api/user/2.0", headers: headers, verify_ssl: false)
    @auth_api = RestClient::Resource.new("https://#{get_sb_host}/api/auth/2.0", headers: headers, verify_ssl: false)
  end

  # Returns the service bridge host based on hostname for API related stuff.
  def get_sb_host
    if ENV['HOST'].match(/(vw)([0-9]+)/)
      env = ENV['HOST'].match(/(vw)([0-9]+)/)
      return "10.69.1#{env[2]}.103"
    elsif ENV['HOST'].match(/([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)/)
      env = ENV['HOST'].match(/([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)/)
      return "#{env[1]}.#{env[2]}.#{env[3]}.103"
    else
      return nil
    end
  end

  def get_login_token(user, password)
    data = {
      username: user,
      password: password
    }.to_json
    login = @auth_api['/login'].post(data)
    # STDOUT.puts login.response
    JSON.parse(login)['access_token']
  end

  def remove_current_car(uuid, access_token, car_id)
    auth_header = { Authorization: "Bearer #{access_token}" }
    @user_api["/users/#{uuid}/cars/#{car_id}"].delete auth_header
  end

  def add_new_current_car(uuid, access_token, car_name)
    car_data = {
      displayName: car_name,
      carStatus: 'CURRENT',
      carDetails: {
        registrationNumber: 'YG61YRO',
        model: 'Golf',
        derivative: 'GOLF GTI',
        registrationDate: '2014-02-12',
        fuelType: 'Petrol',
        #:vin => "WVWZZZ1KZCW0550001",
        year: '2014',
        engineCapacity: '1.2',
        transmission: 'Manual'
      },
      servicedByRetailer: '00050',
      suppliedByRetailer: '00051',
      purchaseType: 'NEW_CAR'
    }.to_json

    auth_header = { Authorization: "Bearer #{access_token}" }
    @user_api["/users/#{uuid}/cars"].post car_data, auth_header
  end

  def add_new_ordered_car(uuid, access_token, order_number)
    car_data = {
      orderNumber: order_number,
      displayName: 'ORDER_CAR_TEST'
    }.to_json

    auth_header = { Authorization: "Bearer #{access_token}" }
    begin
      @user_api["/users/#{uuid}/cars/order"].post car_data, auth_header
    rescue RestClient::Exception => e
      STDOUT.puts e.response
    end
  end
end
