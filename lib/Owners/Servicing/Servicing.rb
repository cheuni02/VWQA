#!/bin/env ruby
# encoding: utf-8

class Servicing < Owners
  def visit
    visit_page(page_url)
  end

  def page_loaded?
    options.present?
  end

  def fixed_price_servicing
    FixedPriceService.new(@browser)
  end

  def volkswagen_service_plans
    VolkswagenServicePlans.new(@browser)
  end

  def extended_warranty
    ExtendedWarranty.new(@browser)
  end

  def service_promise
    ServicePromise.new(@browser)
  end

  def service_plan
    ServicePlan.new(@browser)
  end

  def parts_guarantee
    PartsGuarantee.new(@browser)
  end

  def genuine_parts
    VolkswagenGenuinePartsPage.new(@browser)
  end

  def body_repair
    BodyRepair.new(@browser)
  end

  def express_fit
    ExpressFit.new(@browser)
  end

  def what_we_check_and_why
    WhatWeCheck.new(@browser)
  end

  def winter_check
    WinterCheck.new(@browser)
  end

  def express_visual_check
    ExpressVisualCheck.new(@browser)
  end

  def areas_we_cover
    AreasWeCover.new(@browser)
  end

  def get_title
    page_title.text
  end

  def click_link(link)
    case (link)
    when 'Book my Service/MOT'
      book_service.click
    when 'Volkswagen Service Promise'
      promise.click
    when 'Volkswagen Service Plans'
      plans.click
    when 'Volkswagen Parts guarantee'
      parts.click
    when 'Body Repair'
      body.click
    when 'Express fit'
      expressfit.click
    when 'What we check and why'
      whatwecheck.click
    when 'Winter Health Check £20'
      wintercheck.click
    else fail
    end
  end

  private

  def page_url
    '/owners/servicing'
  end

  def options
    @browser.div(class: 'grid-row')
  end

  def page_title
    @browser.div(id: 'page').div(class: 'grid-6').h1
  end

  def book_service
    @browser.div(class: 'vw-adaptive-vertical-button', index: 0)
  end

  def promise
    @browser.div(class: 'vw-adaptive-vertical-button', index: 1)
  end

  def plans
    @browser.div(class: 'vw-adaptive-vertical-button', index: 2)
  end

  def parts
    @browser.div(class: 'vw-adaptive-vertical-button', index: 3)
  end

  def body
    @browser.div(class: 'vw-adaptive-vertical-button', index: 4)
  end

  def expressfit
    @browser.div(class: 'vw-adaptive-vertical-button', index: 5)
  end

  def whatwecheck
    @browser.div(class: 'vw-adaptive-vertical-button', index: 6)
  end

  def wintercheck
    @browser.div(class: 'vw-adaptive-vertical-button', index: 7)
  end
end
