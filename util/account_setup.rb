require 'dbi'
require 'json'

all_accounts = JSON.parse(File.read("../users.json"))
active_accounts = all_accounts['User_accounts'][ENV['HOST']]

raise ArgumentError "No accounts defined for environment #{ENV['HOST']}" if all_accounts['User_accounts'][ENV['HOST']].nil?

puts "Setting Account Status to enabled..."
DBI.connect("DBI:Mysql:vw_auth:#{ENV['DBHOST']}", 'vw_auth', 'vw_auth') do |dbh|
  sql = "UPDATE auth_user SET enabled = 1 WHERE username = ?"

  dbh.prepare(sql) do |sth|
    active_accounts.each do |account|
      sth.execute(account['username'])
      puts "#{account['username']} Successfully enabled"
    end
  end
end

DBI.connect("DBI:Mysql:vw_auth:#{ENV['DBHOST']}", 'vw_auth', 'vw_auth') do |dbh|

  active_accounts.each do |account|
    case account['purpose']
    when "DBG_User"
      dbh.do("UPDATE my_customer_contact SET dbg_id = 11033601 WHERE email = #{account['username']}")
    when "DBG_User_Invalid"
      dbh.do("UPDATE my_customer_contact SET dbg_id = 999999999999999 WHERE email = #{account['username']}")
    when "Add_car_User"



    end






  end



end
