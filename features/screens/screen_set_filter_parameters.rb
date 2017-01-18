class ScreenSetFilterParameters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @parameter_holders = element(:id, 'parameter_body_holder')
    @filter_name = element(:id, 'param_filter_name')
    @button_save = element(:id, 'save_filter')
    @parameter_name = element(:id, 'parameter_name')
    @parameter_lower = element(:id, 'left_param')
    @parameter_upper = element(:id, 'right_param')
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

  def save_filter
    @driver.find_element(
      @button_save[:type], @button_save[:value]
    ).click
  end

  def set_parameter(parameter, lower, upper)
    @driver.find_elements(
      @parameter_holders[:type], @parameter_holders[:value]
    ).each do |param|
      next unless param.find_element(@parameter_name[:type], @parameter_name[:value]).text == parameter

      param.find_element(@parameter_lower[:type], @parameter_lower[:value]).send_keys(lower)
      param.find_element(@parameter_upper[:type], @parameter_upper[:value]).send_keys(upper)
    end
  end

end
