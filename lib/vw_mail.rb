class VWMail
  def initialize
    Mail.defaults do
      retriever_method :imap,
                       address: 'imap.gmail.com',
                       port: 993,
                       user_name: 'ddbtribal1@gmail.com',
                       password: 'Abcd!2345',
                       enable_ssl: true
    end
  end

  def get_last_five_emails
<<<<<<< HEAD
    retry_count = 0
    mails = Array.new
    5.times do
      begin
       mails = Mail.find(what: :last, count: 5, order: :desc)
       rescue OpenSSL::SSL::SSLError
        STDOUT.puts "SSL Connection failed, attempts: #{retry_count}"
        retry_count += 1
        retry
      end
    end
    return mails
=======
    Mail.find(what: :last, count: 5, order: :desc)
>>>>>>> 1dbb8c68ca627489ae8d58d931af52f6d7f1b46d
  end

  def get_last_email(subject)
    emails = get_last_five_emails
    emails.each do |email|
      return email if email.subject == subject
    end
    nil
  end

  def get_email_text_body(email)
    email.text_part.decoded
  end

  def get_email_token_link(email)
    get_email_text_body(email).match(/http\:\/\/[A-Za-z0-9.\/\-\?\=]+/)[0].to_s
  end
end
