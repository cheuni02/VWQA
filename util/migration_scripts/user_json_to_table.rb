require 'json'
require 'dbi'
require 'open-uri'


class TableHandler

  def users_file
    JSON.parse(File.read("../../users.json"))
  end

  def envs
    users_file['User_accounts']
  end

  def db_connect
    DBI.connect("DBI:Mysql:user_db_ivan_machine:localhost","root","Tribaluser12")
  end



  def create_table(tbl_name,tbl_headers)
    begin
      sth = db_connect.prepare("SELECT * FROM #{tbl_name}")
      sth.execute
    rescue DBI::DatabaseError => e

      puts "error code: #{e.err}..."
      case e.err
        when 1146
          puts "#{tbl_name} not created! creating it ..."
          sth = db_connect.prepare("CREATE TABLE #{tbl_name} (#{tbl_headers});")
          sth.execute
      end
      retry

    end
  end

  def insert_data(tbl_name)
    envs.each do |a|
      puts a[0]
      sth = db_connect.prepare("INSERT INTO #{tbl_name} (env_url) VALUES (?);")
      sth.execute(a[0])
    end
  end

  def display_table(tbl_name)
    sth = db_connect.prepare("SELECT * FROM #{tbl_name};")
    sth.execute

    sth.fetch do |row|

      puts "now tbl_env table rows: "
      puts "id is #{row[0]}"
      puts "url is #{row[1]}"

    end
  end

end


  ## check env table exists and if not create it

  hand = TableHandler.new


  tbl_headers = "env_id INT NOT NULL AUTO_INCREMENT, env_url VARCHAR(40), PRIMARY KEY(env_id)"
  hand.create_table('tbl_env',tbl_headers)

  ## insert data
  puts "list of environments to be inserted to tb_envs table:"
  hand.insert_data('tbl_env')

  ## display table
  hand.display_table('tbl_env')

  ## check user table exists and if not create it

  tbl_headers = "usr_id INT NOT NULL AUTO_INCREMENT, env_id INT NOT NULL, usr_username VARCHAR(40), usr_title VARCHAR(40), usr_lastname VARCHAR(40), usr_password VARCHAR(40), usr_purpose VARCHAR(40), uuid INT, optional_details_id INT, PRIMARY KEY(usr_id), FOREIGN KEY(env_id) REFERENCES tbl_env(env_id)"
  hand.create_table('tbl_usr',tbl_headers)







