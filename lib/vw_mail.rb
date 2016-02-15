class VWMail

  def initialize
    Mail.defaults do
      retriever_method :imap,
      :address => "imap.gmail.com",
      :port => 993,
      :user_name => 'ddbtribal1@gmail.com',
      :password  => 'Abcd!2345',
      :enable_ssl => true
    end
  end

  def get_last_five_emails
     return Mail.find(:what => :last, :count => 5, :order => :desc)
  end

  def get_last_email(subject)
    emails = get_last_five_emails
    emails.each do |email|
      if email.subject == subject
        return email
      end
    end
    return nil
  end

  def get_email_text_body(email)
    return email.text_part.decoded
  end

  def get_email_token_link(email)
    return get_email_text_body(email).match(/http\:\/\/[A-Za-z0-9.\/\-\?\=]+/)[0].to_s
  end
end
