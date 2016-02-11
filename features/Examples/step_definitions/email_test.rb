Given 'i have sent an email verification to my address' do
  # Do nothing
end

When /^i check that my verification email is in my inbox$/ do
  @email = site.vw_emails.get_last_email('Volkswagen email verification')
end

Then /^i should find i have a message recieved$/ do
  expect(@email).to_not be_nil
end

And /^i should find my message has a verification token for me to use$/ do
  STDOUT.puts site.vw_emails.get_email_token_link(@email)
  expect(site.vw_emails.get_email_token_link(@email)).to_not be_nil
end
