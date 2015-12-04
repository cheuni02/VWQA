class ServiceBase < Owners

  def what_we_check_and_why
    WhatWeCheckAndWhyPage.new(@browser)
  end

  def service_promise
    ServicePromisePage.new(@browser)
  end

  def volkswagen_genuine_parts
    VolkswagenGenuinePartsPage.new(@browser)
  end










end
