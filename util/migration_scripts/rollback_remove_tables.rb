require 'json'
require 'dbi'
require 'open-uri'

DBI.connect("DBI:Mysql:user_db_ivan_machine:localhost","root","Tribaluser12") do |dbh|

  #str = "select * from \
  #      tbl_env"
  #remove env_tbl



  begin
    sth = dbh.prepare('DROP TABLE IF EXISTS tbl_usr;')
    sth.execute

    sth = dbh.prepare('DROP TABLE IF EXISTS tbl_env;')
    sth.execute



  rescue DBI::DatabaseError => e
    puts "ErrorCode : #{e.err}"

  end

  sth.finish

end