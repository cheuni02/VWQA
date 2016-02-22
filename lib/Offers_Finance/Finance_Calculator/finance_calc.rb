class FinanceCalculatorNew < OffersFinance
  def visit
    visit_page(page_url)
  end

  def click_car_model(model_name)
    car_model_list.each do |my_model|
      if my_model.link.h2.text =~ /#{model_name}/i
        my_model.link.click
        break
      end
    end
  end

  def wait_for_calc_page
    calc_page.wait_until_present
  end

  def finance_table_present?
    finance_table.present?
  end

  def change_trim(trim_name)
    copy = trim_name_shown.select("#{trim_name}")
    y = copy.match(/#{trim_name}/)
  end

  def check_trim_derivative(_trim_name)
    copyToCheck = trim_shown.h4.text
  end

  def set_deposit(deposit)
    deposit_text.set("#{deposit}")
    deposit_button.click
  end

  def check_deposit_in_table(_deposit)
    copyToCheck = finance_table.tr(index: 2).td.text
  end

  def click_month(month)
    repayment_months_shell.label(for: "#{month}months").click
  end

  def check_month_in_table(month)
    copyToCheck = finance_table.tr(index: 0).td.text
    copyToCheck.match(/#{month}/)
  end

  def click_mileage(mileage)
    mileageInt = mileage.to_i
    mileageInt /= 1000
    average_car_mileage_shell.label(for: "#{mileageInt}miles").click
  end

  def check_mileage(_mileage)
    copyToCheck = finance_table.tr(index: 1).td.text

    copyToCheckMod = copyToCheck.gsub(/,/i, '')
  end

  private

  def page_url
    '/financeCalculator/chooseModel'
  end

  def car_model_list
    @browser.ol(class: 'car-thumbnails').lis
  end

  def calc_page
    @browser.div(id: 'finance-calc')
  end

  def finance_table
    @browser.table(class: 'finance-table')
  end

  def repayment_months_shell
    @browser.ul(id: 'repaymentMonthsShell')
  end

  def average_car_mileage_shell
    @browser.ul(id: 'averageCarMileageShell')
  end

  def trim_name_shown
    @browser.select(id: 'trimName')
  end

  def deposit_text
    @browser.text_field(id: 'deposit')
  end

  def deposit_button
    @browser.button(class: 'button cta rounded')
  end

  def trim_shown
    @browser.div(class: 'summary finance-details')
  end
end
