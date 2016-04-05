require 'json'
require 'dbi'
require 'open-uri'

begin

file = File.read("../../users.json")
json = JSON.parse(file)

#check if 'env' and 'user_acc' tables exist. If not create them
  dbh = DBI.connect("DBI:Mysql:user_db_ivan_machine:localhost","root","Tribaluser12")

  sth = dbh.prepare("SELECT * FROM tbl_env")
  sth.execute

  sth.fetch do |row|

    puts "1) so far tbl_env table rows: "
    puts "id is #{row[0]}"
    puts "url is #{row[1]}"

  end

  puts "inserting data into table ..."

  sth = dbh.prepare("INSERT INTO tbl_env (env_url) VALUES ('www.volkswagen.co.uk'), ('origin.volkswagen.co.uk');")
  sth.execute

  sth = dbh.prepare("SELECT * FROM tbl_env")
  sth.execute

  sth.fetch do |row|

    puts "2) now tbl_env table rows: "
    puts "id is #{row[0]}"
    puts "url is #{row[1]}"

  end


  sth.finish

rescue DBI::DatabaseError => e

 puts "error code: #{e.err}..."
 case e.err
   when 1146
     puts "tbl_env not created! creating it ..."
     sth = dbh.prepare("CREATE TABLE tbl_env (env_id INT NOT NULL AUTO_INCREMENT, env_url VARCHAR(40), PRIMARY KEY(env_id));")
     sth.execute
 end
 retry

end