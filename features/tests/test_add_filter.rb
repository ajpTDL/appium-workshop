class TestAddFilter
  attr_accessor :driver
  def initialize(screens)
    @screens = screens
  end

  def select_category(category)
    @screens.screen_create_filter.visible?
    @screens.screen_create_filter.select_row category
  end

  def select_type
    @screens.screen_select_sub_category.visible?('Nekustamie īpašumi')
    @screens.screen_select_sub_category.select_sub_category 'Zeme'
  end

  def select_district
    @screens.screen_select_sub_category.visible?('Zeme')
    @screens.screen_select_sub_category.select_sub_category 'Ventspils un rajons'
  end

  def select_town
    @screens.screen_select_sub_category.visible?('Ventspils un rajons')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def select_action
    @screens.screen_select_sub_category.visible?('Darbība')
    @screens.screen_select_sub_category.select_sub_category 'Visi'
  end

  def submit_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def create_empty_filter
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    submit_filter_parameters
  end

  def set_name(filter_name)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name filter_name
  end

  def set_parameter(parameter, lower, upper)
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_parameter(parameter, lower, upper)
  end

  def create_filter_with_parameters
    select_category 'Nekustamie īpašumi'
    select_type
    select_district
    select_town
    select_action
    set_name 'Filter 1'
    set_parameter('CENA (EUR)', '1', '1000')
    set_parameter('PLATĪBA (M2)', '1', '3000')
    submit_filter_parameters
  end
end
