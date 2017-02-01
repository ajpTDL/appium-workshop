class ScreenCreateFilter < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @title = element(:text, 'Izveidot filtru')
    @rows = element(:id, 'main_row_text')
    @toolbar_actionbar = element(:id, 'toolbar_actionbar')
    @toolbar_actionbar_categories = element(:id, 'toolbar_actionbar_categories')
    @back_button = element(:class, 'android.widget.ImageButton')
    @menu_item = element(:id, 'item_name')
    @driver = driver
  end

  def visible?
    @driver.wait { @driver.text(@title[:value]).displayed? }
  end

  def select_row(category_name)
    @driver.find_elements(@rows[:type], @rows[:value]).each do |row|
      if row.text == category_name
        row.click
        break
      end
    end
  end

  def go_to_main
    if @driver.find_elements(@toolbar_actionbar_categories[:type], @toolbar_actionbar_categories[:value]).size != 0
      toolbar_category = @driver.find_element(@toolbar_actionbar_categories[:type], @toolbar_actionbar_categories[:value])
      while toolbar_category do
        toolbar_category.find_element(@back_button[:type], @back_button[:value]).click
        if @driver.find_elements(@toolbar_actionbar_categories[:type], @toolbar_actionbar_categories[:value]).size != 0
          toolbar_category = @driver.find_element(@toolbar_actionbar_categories[:type], @toolbar_actionbar_categories[:value])
        else
          toolbar_category = false
        end
      end
    else
      @driver.find_element(@toolbar_actionbar[:type], @toolbar_actionbar[:value]).find_element(@back_button[:type], @back_button[:value]).click
      @driver.find_elements(@menu_item[:type], @menu_item[:value]).each do |menu_entry|
        if menu_entry.text == @title[:value]
          menu_entry.click
          break
        end
      end
    end
  end
end
