require 'json'
require 'dbi'
require 'open-uri'




users_file = JSON.parse(File.read("../../users.json"))

envs = users_file['User_accounts']


DBI.connect("DBI:Mysql:user_db_ivan_machine:localhost","root","Tribaluser12") do |dbh|


  ## check table exists
  begin
    sth = dbh.prepare("SELECT * FROM tbl_env")
    sth.execute
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


  ## if exists, input rows from JSON file to table
  # puts "inserting data into table ..."
  #
  # sth = dbh.prepare("INSERT INTO tbl_env (env_url) VALUES ('www.volkswagen.co.uk'), ('origin.volkswagen.co.uk');")
  # sth.execute

  puts "list of environments to be inserted to tb_envs table:"



  envs.each do |a|

    puts a[0]#["username"]
     sth = dbh.prepare("INSERT INTO tbl_env (env_url) VALUES (?);")
     sth.execute(a[0])
  end


  ## display table
  sth = dbh.prepare("SELECT * FROM tbl_env")
  sth.execute

  sth.fetch do |row|

    puts "now tbl_env table rows: "
    puts "id is #{row[0]}"
    puts "url is #{row[1]}"

  end


  sth.finish


end