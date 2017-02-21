require 'yaml'
class Filter
  attr_accessor :name, :category, :sub_categories, :parameters

  def initialize
    @name = ""
    @category = ""
    @sub_categories = []
    @parameters = []
  end

  def load_config(type)
    config = YAML.load_file('features/config/filters.yml')[type]
    @name = config['name']
    @category = config['category']
    @sub_categories = []
    if config.has_key? 'sub_categories'
      config['sub_categories'].each do |sub_cat|
        @sub_categories.push sub_cat
      end
    end
    @parameters = []
    if config.has_key? 'parameters'
      config['parameters'].each do |parameter|
        @parameters.push parameter
      end
    end
  end

  def print_properties
    print 'Name:' + @name
    print "\nCategory:" + @category
    print "\nSub Categories:"
    @sub_categories.each do |sub_cat|
      print "\n\t - " + sub_cat['title'] + ' ' + sub_cat['option']
    end
    print "\nParameters:"
    @parameters.each do |parameter|
      print "\n\t - " + parameter['name'] + ' ' + parameter['left'] + ' ' + parameter['right']
    end
    print "\n\n"
  end
end
