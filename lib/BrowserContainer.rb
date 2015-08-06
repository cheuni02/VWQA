#!/bin/env ruby
# encoding: utf-8

class BrowserContainer

  def initialize(browser)
    @browser = browser
    @browser.cookies.add('ico-cookies', 'true', {:path => "/", :expires => Time.now + 86400, :secure => false})
    @browser.cookies.add('poi', 'Non-Psyma', {:path => "/", :expires => Time.now + 86400, :secure => false})
    @first = true
  end

  def get_source
    @browser.html
  end

  def visit_page(page_url = "")
=begin
    case ENV['TAG'].to_sym
    when :dev01, :stage_v
      url = URLS.gsub('http://', "http://#{VW_USER}:#{VW_PASSWORD}@")  + page_url
      #STDOUT.puts url
      @browser.goto(url.sub('http', 'https'))
      #@browser.goto(url)
      #url = URLS.gsub('http://', "http://#{VW_USER}:#{VW_PASSWORD}@")  + page_url
    when :int, :uat
      url = URLS.gsub("http://", "https://#{VW_USER}:#{VW_PASSWORD}@") + page_url
      #STDOUT.puts url
      @browser.goto(url)
      @browser.goto(url.sub('https', 'http'))
    else
      @browser.goto(URLS + page_url)
    end
=end
    @browser.goto(URLS + page_url)
  end

  def visit_page_mpv(page_url = "")
    case ENV['TAG'].to_sym
    when :stage
     base_url = ("https://#{VW_USER}:#{VW_PASSWORD}@perfect-stage-vw.tribalddb.co.uk")
    when :live
      base_url = ("https://perfect.volkswagen.co.uk")
    end
    #base_url = ("https://perfect.volkswagen.co.uk")
    #STDOUT.puts base_url + page_url
    @browser.goto (base_url + page_url) if (ENV['TAG'].to_sym == :stage || ENV['TAG'].to_sym == :live)
    @browser.refresh
  end



end
