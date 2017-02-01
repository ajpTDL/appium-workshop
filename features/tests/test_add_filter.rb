require_relative '../config/filters'
class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
    @filter_data = Filter.new()
  end

  def select_category
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row(@filter_data.category)
  end

  def select_sub_category(sub_cat_hash)
    @screens.screen_select_sub_category.visible?(sub_cat_hash['title'])
    @screens.screen_select_sub_category.select_sub_category(
      sub_cat_hash['option']
    )
  end

  def open_filter_parameter_screen
    select_category
    @filter_data.sub_categories.each do |sub_category|
      select_sub_category(sub_category)
    end
  end

  def set_filter_name
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name(@filter_data.name)
  end

  def set_all_parameters
    @screens.screen_set_filter_parameters.visible?
    @filter_data.parameters.each do |parameter|
      @screens.screen_set_filter_parameters.set_parameter(parameter)
    end
  end

  def submit_filter_data
    set_filter_name
    set_all_parameters
    @screens.screen_set_filter_parameters.save_filter
  end

  def create_filter(type)
    @filter_data.load_config(type)
    open_filter_parameter_screen
    set_all_parameters
    set_filter_name
    submit_filter_data
  end

  def set_name(filter_name)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name filter_name
  end

  def go_to_main
    @screens.screen_create_filter.go_to_main
  end
end
