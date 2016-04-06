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

  def insert_env_data(tbl_name)
    envs.each do |a|
      puts a[0]
      sth = db_connect.prepare("INSERT INTO #{tbl_name} (env_url) VALUES (?);")
      sth.execute(a[0])
    end
  end

  def insert_data
    i=0
    envs.each do |a|
      puts "env = #{a[0]}"
      # sth = db_connect.prepare("INSERT INTO tbl_env (env_url) VALUES (?);")
      # sth.execute(a[0])



      a[0].each do |b|
        puts "other attributes = #{b}"
      end

      i+=1
      break if i == 1
    end

    # sth = db_connect.prepare("INSERT INTO tbl_env (env_url) VALUES (?);")
    # puts "envs['User_accounts'] = #{envs}"

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


tbl_env_headers = "env_id INT NOT NULL AUTO_INCREMENT, env_url VARCHAR(40), PRIMARY KEY(env_id)"
tbl_usr_headers = "usr_id INT NOT NULL AUTO_INCREMENT, env_id INT NOT NULL, usr_username VARCHAR(40), \
                  usr_title VARCHAR(40), usr_lastname VARCHAR(40), usr_password VARCHAR(40), \
                  usr_purpose VARCHAR(40), uuid INT, optional_details_id INT, PRIMARY KEY(usr_id), \
                  FOREIGN KEY(env_id) REFERENCES tbl_env(env_id)"
tbl_option_headers = "option_id INT NOT NULL AUTO_INCREMENT, usr_id INT, address_type VARCHAR(20), \
                  house_number int(4), postcode VARCHAR(10), street VARCHAR(40), street2 VARCHAR(40), \
                  city VARCHAR(30), county VARCHAR(30), phone1 INT(20), phone2 INT(20), phone_type VARCHAR(10), \
                  work_phone INT(20), preferred_contact VARCHAR(10), marital_status VARCHAR(20), \
                  date_of_birth VARCHAR(30), PRIMARY KEY (option_id), FOREIGN KEY(usr_id) REFERENCES tbl_usr(usr_id)"


  ############ check env, usr and options tables exist and if not create them

  hand = TableHandler.new

  ## 1) check env table exists and if not create it
  hand.create_table('tbl_env',tbl_env_headers)

  ## 2) check user table exists and if not create it
  hand.create_table('tbl_usr',tbl_usr_headers)

  ## 3) check optional_details table exists and if not create it
  hand.create_table('tbl_usr',tbl_option_headers)


  ############ insert data

  puts "list of environments to be inserted to tb_envs table:"

  ## 1) insert tbl_env from user.json in sequential order
  hand.insert_data




  ############ display tables
  #hand.display_table('tbl_env')





