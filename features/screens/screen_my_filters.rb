class ScreenMyFilters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @top_toolbar = element(:id, 'toolbar_actionbar')
    @row_filter_name = element(:id, 'row_filter_name')
    @screen_name_my_filters = element(:class, 'android.widget.TextView')
    @driver = driver
  end

  def visible?
    visible = false
    @driver.wait do
      @driver.find_elements(
        @screen_name_my_filters[:type], @screen_name_my_filters[:value]
      ).each do |text|
        next unless text.text == 'Meklēšanas filtri'
        visible = true
        break
      end
    end
    visible
  end

  def filter_visible?(filter_name)
    @driver.find_elements(
      @row_filter_name[:type], @row_filter_name[:value]
    ).each do |filter|
      next unless filter.text == filter_name
      filter.displayed?
      break
    end
  end
end
