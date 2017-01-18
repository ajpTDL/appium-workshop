class TestMyFilters
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def filter_visible?
    @screens.screen_my_filters.visible?
    @screens.screen_my_filters.filter_visible? 'Filter 1'
  end
end
