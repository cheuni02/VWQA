require 'json'
require 'dbi'
require 'open-uri'

begin

file = File.read("../../users.json")
json = JSON.parse(file)

#check if 'env' and 'user_acc' tables exist. If not create them
  dbh = DBI.connect("DBI:Mysql:user_db_ivan_machine:localhost","root","Tribaluser12")

  sth = dbh.prepare("SHOW TABLES LIKE 'tbl_env';")
  sth.execute

  if exists()

  # sth.fetch do |row|
  #   printf "row is #{row}"
  #   if row == nil
  #   printf "rows are nil!"
  #     break
  #   end
  # end

  sth.finish

rescue DBI::DatabaseError => e

 puts "error code: #{e.err}"
end