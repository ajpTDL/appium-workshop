class ScreenSelectSubCategory < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @rows = element(:id, 'category_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
    @driver.wait do
      @driver.find_element(
        @rows[:type], @rows[:value]
      ).displayed?
    end
  end

  def select_sub_category(sub_name)
    found = true
    @cat_array = []
    while found do
      @category = @driver.find_elements(@rows[:type], @rows[:value])
      @category.each do |item|
        @cat_array.push item.text
        p @cat_array
        if item.text == sub_name
          found = false
          item.click
          break
          else
          @driver.swipe(startx: 0, starty: 0, delta_x: 0, delta_y: 1, duration: 900)
        end
      end
    end
  end
end
