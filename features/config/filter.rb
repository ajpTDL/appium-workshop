require 'yaml'
class Filter
  def initialize(type)
    config = YAML.load_file('filters.yml')[type]
    @name = config['name']
    @category = config['category']
    @sub_categories = []
    @parameters = []
    config['sub_categories'].each do |sub_cat|
      @sub_categories.push({'title' => sub_cat['sub_category'][0]['title'], 'option' => sub_cat['sub_category'][1]['option']})
    end
    config['parameters'].each do |param|
      @parameters.push({'name' => param['parameter'][0]['name'], 'left' => param['parameter'][1]['left'], 'right' => param['parameter'][2]['right']})
    end
  end

  def print_properties
    print "Name: " + @name
    print "\nCategory: " + @category
    print "\nSub categories: "
    @sub_categories.each do |sub_cat|
      print "\n\t - " + sub_cat['title'] + " / " + sub_cat['option']
    end
    print "\nParameters: "
    @parameters.each do |param|
      print "\n\t - " + param['name'] + " : " + param['left'] + " / " + param['right']
    end
  end
end

filter = Filter.new('property_positive')
filter.print_properties
