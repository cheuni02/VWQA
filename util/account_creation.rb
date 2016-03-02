require 'rest-client'
require 'json'

PURPOSES = %w(
  General
  DBG_User_History_Plan
  DBG_User_Plan
  DBG_User_History
  DBG_User_History_Ext
  DBG_User_Nothing
  Current_car_User
  Current_car_User_Ext
  Ordered_Car_User
  All_details_complete_user
  Delete_Car_User
  Forgotten_password_user
  Single_current_car_user)

users = JSON.parse(File.read('../users.json'))
new_users = []

fail ArgumentError, 'Script cannot be used on live environments!' if ENV['HOST'] =~ /(volkswagen|www\.vw\.co\.uk)/i

begin
  puts "Attempting to create accounts on #{ENV['HOST']} Environment"

  unless users['User_accounts'][ENV['HOST']].nil?
    puts 'Detected Existing users for environment... deleting entries'
    users['User_accounts'].delete(ENV['HOST'])
  end

  puts 'Creating New User Stubs...'
  ctime = Time.now.to_i
  index = 0

  PURPOSES.each do |purpose|
    hash = {}
    hash['title'] = 'Mr'
    hash['firstname'] = "#{purpose}"
    if purpose == 'Forgotten_password_user'
      hash['username'] = "ddbtribal1+#{ctime - index}@gmail.com"
    else
      hash['username'] = "AutomatedToastUser#{ctime - index}@example.com"
    end
    # hash['username'] = "AutomatedToastUser#{ctime - index}@example.com"
    hash['password'] = 'Abcd!2345'
    hash['purpose'] = purpose
    hash['optional_details'] = {}
    if purpose == 'All_details_complete_user' || purpose == 'Current_car_User' || purpose =~ /DBG/
      hash['optional_details'] = {
          address_type: 'home',
          house_number: '4000',
          postcode: 'UB6 7HA',
          street: 'Empire Road',
          street2: 'Empire Place',
          city: 'LONDON',
          county: 'MIDDLESEX',
          phone1: '01234567890',
          phone2: '09876543210',
          phone_type: 'home',
          work_phone: '54321098765',
          preferred_contact: 'email',
          marital_status: 'Single',
          date_of_birth: '1989-08-04 00:00:00'
      }
    end

    case purpose
    when 'DBG_User_History_Plan'
      hash['lastname'] = 'Anderson'
      hash['optional_details'][:postcode] = 'TS17 5BH'
    when 'DBG_User_Plan'
      hash['lastname'] = 'Ruthven'
      hash['optional_details'][:postcode] = 'EH15 3AJ'
    when 'DBG_User_History'
      hash['lastname'] = 'Mcanulty'
      hash['optional_details'][:postcode] = 'HD7 4AH'
    when 'DBG_User_Nothing'
      hash['lastname'] = 'Clerk'
      hash['optional_details'][:postcode] = 'NW2 2AJ'
    when 'DBG_User_History_Ext'
      hash['lastname'] = 'Roblin'
      hash['optional_details'][:postcode] = 'SA12 9PT'
    else
      hash['lastname'] = 'Tester'
    end

    index += 1
    # puts hash
    # sleep(3)
    new_users.push(hash)
  end

  headers = {
    :accept => 'application/json',
    :content_type => 'application/json',
    #:'x-access-username' => ENV['ACCESSUSER'],
    #:'x-access-password' => ENV['ACCESSPW']
    :'x-access-username' => 'test_client',
    :'x-access-password' => 'Manuela1999'
  }

  puts 'Registering Users Via Authentication API'
  resource = RestClient::Resource.new("https://#{ENV['HOST']}", headers: headers, verify_ssl: false)

  new_users.each do |user|
    my_user = user.clone
    my_user.delete('purpose')
    my_user.delete('optional_details')

    res = resource['/api/auth/2.0/register'].post my_user.to_json
    user['uuid'] = JSON.parse(res)['uuid']
    puts "Successfully created account - #{my_user['username']}"
  end

  puts 'Writing Data to JSON File for generated Users...'

  users['User_accounts'][ENV['HOST']] = new_users

  File.open('../users.json', 'w') do |file|
    # my_json = users.to_json
    file.write(JSON.pretty_generate(users))
  end
end
