class ScreenMyFilters < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @top_toolbar = element(:id, 'toolbar_actionbar')
    @row_filter_name = element(:id, 'row_filter_name')
    @screen_name_my_filters = element(:class, 'android.widget.TextView')
    @driver = driver
  end

  def visible?
    @driver.wait do
      @driver.text('Meklēšanas filtri').displayed?
    end
  end

  def filter_visible?(filter_name)
    @driver.text(filter_name).displayed?
  end
end
