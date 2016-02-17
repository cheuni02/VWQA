class ServicePlan < Servicing
  def page_loaded?
    service_plans.present?
  end

  def service_plans
    @browser.div(class: 'service-plans-tabs')
  end
end
