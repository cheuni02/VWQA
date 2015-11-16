require 'restclient'
require 'json'

PURPOSES = ['General', 'Unvalid_User', 'Add_car_User', 'Ordered_User']

users = JSON.parse(File.read("../users.json"))
new_users = []

raise ArgumentError, "Script cannot be used on live environments!" if ENV['HOST'] =~ /(volkswagen|www\.vw\.co\.uk)/i

begin
  puts "Attempting to create accounts on #{ENV['HOST']} Environment"

  unless users['User_accounts'][ENV['HOST']].nil?
    puts "Detected Existing users for environment... deleting entries"
    users['User_accounts'].delete(ENV['HOST'])
  end

  puts "Creating New User Stubs..."
  ctime = Time.now.to_i
  index = 0

  PURPOSES.each do |purpose|
    hash = Hash.new
    hash['title'] = 'Mr'
    hash['firstname'] = "#{purpose}"
    hash['lastname'] = 'Dragon'
    hash['username'] = "AutomatedDragonUser#{ctime - index}@example.com"
    hash['password'] = 'Abcd!2345'
    hash['purpose'] = purpose
    index += 1
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

  puts "Registering Users Via Authentication API"
  resource = RestClient::Resource.new(ENV['HOST'], :headers => headers , :verify_ssl => false)


  new_users.each do |user|
    my_user = user.clone
    my_user.delete('purpose')

    begin
      resource['/api/auth/2.0/register'].post my_user.to_json
      puts "Successfully created account - #{my_user['username']}"
    rescue RestClient::Exception => e
      puts "User creation for #{user} failed! #{e.message} with #{e.response}"
    end
  end

  puts "Writing Data to JSON File for generated Users..."

  users['User_accounts'][ENV['HOST']] = new_users

  File.open('../users.json', 'w') do |file|
    file.write(users.to_json)
  end
end
