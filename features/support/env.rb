#!/bin/env ruby
# encoding: utf-8

require 'watir-webdriver'
require 'cucumber'
require 'require_all'
require 'securerandom'
require 'fileutils'
require 'json'

screenshot_dir = "html-results/screenshots"
FileUtils.mkdir_p screenshot_dir
Watir.default_timeout = 20

VW_USER = "vw_envs"
VW_PASSWORD = "sooT5wioAhxuiH0o"


URLS = "http://#{ENV['HOST']}"

DEFAULT_ACCOUNT = {
  :title => "Mr",
  :first_name => "AutomatedTestUser",
  :surname => "AutomatedTestUser",
  :email_base => "@example.com",
  :password => "Abcd!2345" ,
  }

require_all 'lib'

if ENV['HEADLESS'] =~ /true/i
  require 'headless'
  headless = Headless.new
  headless.start
end

case ENV['BROWSER']
when /chrome/i
  browser = Watir::Browser.new :chrome
  browser.window.resize_to 1024, 768
when /ie/i
  browser = Watir::Browser.new :ie
  browser.window.resize_to 1024, 768
when /firefox/i
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.disk.capacity'] = 0
  profile['network.http.pipelining'] = true
  profile['network.http.pipelining.maxrequests'] = 8
  browser = Watir::Browser.new :firefox, :profile => profile
else # Default to Firefox if we don't know exactly what we're using
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.disk.capacity'] = 0
  profile['network.http.pipelining'] = true
  profile['network.http.pipelining.maxrequests'] = 8
  browser = Watir::Browser.new :firefox, :profile => profile
  browser.window.resize_to 1024, 768
end


# Auth Handling, forces login to servers in active session
unless ENV['TAG'].to_sym == :live
  browser.goto(URLS.sub('http://', "http://#{VW_USER}:#{VW_PASSWORD}@"))
  browser.goto(URLS.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
  usub = URLS.sub('origin', 'www')
  browser.goto(usub.sub('http://', "https://#{VW_USER}:#{VW_PASSWORD}@"))
end


class CustomWorld
  class << self; attr_accessor :browser end
  #attr_accessor :browser

  def site
    @site ||= (VWBase.new(CustomWorld::browser))
  end

end

CustomWorld.browser = browser

World do
  CustomWorld.new
end





After do |scenario|
  if scenario.failed?
    time = Time.now.strftime("%Y-%m-%d-%H%M%S")
    name = "#{time}-#{scenario.name}".slice(0, 250).gsub(/[\,\/]/, '-')
    name.gsub!(/[\|\s\#]/, '')
    file_dir = "#{screenshot_dir}/#{name}.png"
    browser.screenshot.save "#{file_dir}"
    embed("screenshots/#{name}.png", "image/png" "SCREENSHOT")
  end
end


at_exit do
 browser.close
 if ENV['HEADLESS'] =~ /true/i
   headless.destroy
 end
 begin
   require_relative '../../HTMLReport.rb'
 rescue
   puts "Unable to generate HTML Report - Skipping Report Generation"
 end
end
