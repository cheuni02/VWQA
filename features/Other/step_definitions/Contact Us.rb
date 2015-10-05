Given /^i am on the Contact Us email page$/ do
  @contactUs = site.special_pages.contact_us
  @contactUs.visit
end

And /^i reveal the email panel on the page$/ do
  @contactUs.all_contact_options
  #@contactUs.show_email_panel
end

When /^i enter my name as (.*) (.*) (.*)$/ do |title, first_name, surname|
  @contactUs.set_title(title)
  @contactUs.set_first_name(first_name)
  @contactUs.set_surname(surname)
end

And /^i set my telephone number to (.*) with an email address of (.*)$/ do |telephone, email|
  @contactUs.set_telephone(telephone)
  @contactUs.set_email(email)
end

And /^i enter a sample test message to the email panel before sending my message$/ do
    emailString = %{ Automated Test Email #{Time.now.to_i} -- PLEASE DO NOT REPLY TO THIS EMAIL
    #{SecureRandom.base64(500)}
    }
    @contactUs.set_message(emailString)
    @contactUs.send_message
end

Then /^i should see (success|failed) detailing me about the success of my message$/ do |result|
#   #STDOUT.puts result
  errors = @contactUs.get_errors
  #STDOUT.puts errors.length
  if result =~ /success/i
    raise unless (result =~ /success/i && errors.length == 0)
  else
    raise unless (result =~ /failed/i && errors.length >= 0)
  end
end

When /^i enter my local postcode as "(.*)" to the find by location field$/ do |postcode|
  @contactUs.retailer_search_page
  @contactUs.set_retailer_postcode(postcode)
end

And /^i click on the go button beside this field$/ do
  @contactUs.search_by_retailer_location
end

Then /^i should be shown the retailer search results using the find a retailer system$/ do
  raise AssertionError, "No results" unless @contactUs.retailer_search_result
end

Given /^i return to the main VW Website homepage$/ do
  site.homepage.visit
end

When /^i select the footer link leading to the contact us page$/ do
  site.footer.click_footer_link("Contact Us")
end

Then /^i should see the correct page load in my browser$/ do
  raise PageNotLoadedError unless @contactUs.page_loaded?
end
