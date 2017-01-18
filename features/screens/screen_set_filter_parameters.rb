class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @parameter_name = element(:id, 'parameter_name')
<<<<<<< d89e1d5e11f05b24d9ebc2cdce9eda40d2e3f2bf
    @from_value = element(:id, 'left_param')
    @till_value = element(:id, 'right_param')
=======
    @parameter_lower = element(:id, 'left_param')
    @parameter_upper = element(:id, 'right_param')
>>>>>>> create test for adding filter
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.find_element(
        @parameter_holders[:type], @parameter_holders[:value]
      ).displayed?
    end
  end

  def set_name(text_name)
    @driver.find_element(
      @filter_name[:type], @filter_name[:value]
    ).send_keys(text_name)
  end

  def set_parameter(parameter_hash)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |param|
      next unless param.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter_hash['name']
      param.find_element(@from_value[:type], @from_value[:value]).send_keys(parameter_hash['left'])
      param.find_element(@till_value[:type], @till_value[:value]).send_keys(parameter_hash['right'])
      @driver.press_keycode(4)
    end
end

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end
<<<<<<< d89e1d5e11f05b24d9ebc2cdce9eda40d2e3f2bf
=======

  def set_parameter(parameter, lower, upper)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |param|
      next unless param.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter

      param.find_element(@parameter_lower[:type], @parameter_lower[:value]).send_keys(lower)
      param.find_element(@parameter_upper[:type], @parameter_upper[:value]).send_keys(upper)
    end
  end

>>>>>>> create test for adding filter
end
