require 'dbi'
require 'json'

MODELS_LIST = {
  'fox' => "GF60NLR",
  'e-up!' => 'KM64ZBC',
  'up!' => 'LM13XFA',
  'polo' => 'HG12ZFK',
  'e-golf' => 'LG15KFK',
  'golf' => 'NL62CZM',
  'golf gtd' => 'LT64 WNH',
  'golf cabriolet' => 'NU12RXP',
  'golf plus' => 'FV62XDF',
  'golf estate' => 'LR65AVU',
  'golf sv' => 'KX15VGD',
  'beetle' => 'LM62HTT',
  'beetle cabriolet' => 'LP63XFY',
  'jetta' => 'LP15OVN',
  'passat r-line' => 'KS15LLR',
  'passat estate' => 'GD64WFV',
  'passat alltrack' => 'DE64GZK',
  'volkwagen cc' => 'LP15OVM',
  'scirocco' => 'KE15WLX',
  'tiguan' => 'LR62XHL',
  'eos' => 'RJ11TNL',
  'touran' => 'BD61XPT',
  'sharan' => 'LC15NDO',
  'touareg' => 'KM15HZL',
  'phaeton' => 'HF64KPU'
}

ORDER_MESSAGES = {
  :step_1 => ["PROCESSING_YOUR_ORDER", "Thank you for ordering your new Volkswagen. Your order is currently being processed and will be sent to the factory shortly."],
  :step_2 => ["WITH_THE_FACTORY", "Your order is with the factory and is currently being scheduled for production."],
  :step_3 => ["BUILD_WEEK_CONFIRMED", ""],
  :step_4 => ["BUILD_IN_PROGRESS", "Your car is currently being built. On average it takes 8 weeks from build for this model to reach your local Volkswagen Retailer."],
  :step_5 => ["IN_TRANSIT_A", "Your car has been built and has now left the factory. On average it takes 4 weeks from build for this model to reach your local Volkswagen Retailer."],
  :step_6 => ["ARRIVED_IN_UK", "Your car has now arrived in the UK and will be delivered to your local Volkswagen Retailer shortly. This normally takes 7 days."],
  :step_7 => ["YOUR_CAR_HAS_ARRIVED", "Your car is in the final stage of its journey to your retailer, where it will undergo its final preparation for collection. Your retailer will be in contact soon to arrange handover."]
}

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

ordered_sql = "INSERT INTO my_customer_car_new (id, user_id, car_status, display_name, derivative, financed, model, order_number, delivery_phase_type, delivery_lead_time_statement) VALUES (?,?,?,?,?,?,?,?,?,?)"
current_sql = "INSERT INTO my_customer_car_new (id, user_id, car_status, display_name, derivative, financed, model, ownership, purchase_type, registration_number, serviced_by_retailer_building_name,serviced_by_retailer_contact_email, serviced_by_retailer_contact_name, serviced_by_retailer_county, serviced_by_retailer_dealer_no, serviced_by_retailer_name, serviced_by_retailer_postcode, serviced_by_retailer_street, serviced_by_retailer_telephone, serviced_by_retailer_town, serviced_by_retailer_department_type, year, engine_capacity, fuel_type, transmission) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"

DBI.connect("DBI:Mysql:vw_user:#{ENV['DBHOST']}", 'vw_user', 'vw_user') do |dbh|

  active_accounts.each do |account|
    case account['purpose']
    when "DBG_User"
      dbh.do("UPDATE my_customer_contact SET dbg_id = 11033601 WHERE email = '#{account['username']}'")
    when "DBG_User_Invalid"
      dbh.do("UPDATE my_customer_contact SET dbg_id = 999999999999999 WHERE email = '#{account['username']}'")
    when "Current_car_User"
      dbh.prepare(current_sql) do |sth|
        index = 0
        MODELS_LIST.each do |key, value|
          sth.execute("#{Time.now.to_i}#{index}CTEST", "#{account['uuid']}", "CURRENT", "#{key.upcase}#{index}", "Test #{key.upcase} 999", "b'0'", "#{key.upcase}", "PRIVATE", "NEW_CAR", "#{value}", "Wolsey House", "tribalddbtech@gmail.com", "Victoria Loveday", "Suffolk", "00153", "Ipswich Volkswagen", "IP1 5AN", "Sproughton Road", "01473 240800", "Ipswich", "Service", "2012", "1.80", "Petrol", "Manual")
          index += 1
        end
      end
    when "Max_Car_User"
      dbh.prepare(ordered_sql) do |sth|
        my_step = "step_"
        1.upto(7) do |i|
          my_step = "step_#{i}".to_sym
          sth.execute("#{Time.now.to_i + 1}#{i}MOTEST", "#{account['uuid']}", "ORDERED", "OrderedStep#{i}", "Polo", "b'0'", "Polo", "86557#{i}", "#{ORDER_MESSAGES[my_step][0]}", "#{ORDER_MESSAGES[my_step][1]}")
        end
      end

      limit = 25 - 7

      dbh.prepare(current_sql) do |sth|
        MODELS_LIST.each do |key, value|
          sth.execute("#{Time.now.to_i}#{limit}MCTEST", "#{account['uuid']}", "CURRENT", "#{key.upcase}#{limit}", "Test #{key.upcase} 999", "b'0'", "#{key.upcase}", "PRIVATE", "NEW_CAR", "#{value}", "Wolsey House", "tribalddbtech@gmail.com", "Victoria Loveday", "Suffolk", "00153", "Ipswich Volkswagen", "IP1 5AN", "Sproughton Road", "01473 240800", "Ipswich", "Service", "2012", "1.80", "Petrol", "Manual")
          limit -= 1
          break if limit == 0
        end
      end

    when "Ordered_Car_User"
      dbh.prepare(ordered_sql) do |sth|
        my_step = "step_"
        1.upto(7) do |i|
          my_step = "step_#{i}".to_sym
          sth.execute("#{Time.now.to_i + 1}#{i}OTEST", "#{account['uuid']}", "ORDERED", "OrderedStep#{i}", "Polo", "b'0'", "Polo", "86557#{i}", "#{ORDER_MESSAGES[my_step][0]}", "#{ORDER_MESSAGES[my_step][1]}")
        end
      end
    end
  end
end
