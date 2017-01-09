class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    @button_to_app = element(:id, 'close_intro')
    # 'uz aplikaaciju' pogu meklee peec id jo taa ir unikaala
    @close_intro = element(:id, 'close_intro')
    # paareejiem elementiem id arii ir unikaals, var mekleet peec taa.
    # ja tekstam id nebuutu unikaali vareetu peec xpath
    @intro_footer_image = element(:id, 'intro_footer_image')
    @page_image = element(:id, 'page_image')
    @intro_text_header = element(:id, 'intro_text_header')
    @intro_text_footer = element(:id, 'intro_text_footer')
    @driver = driver
  end

  def visible?
    @driver.alert_accept
    @driver.find_element(@base[:type], @base[:value])
    @driver.find_element(@close_intro[:type], @close_intro[:value])
    @driver.find_element(@intro_footer_image[:type], @intro_footer_image[:value])
    @driver.find_element(@page_image[:type], @page_image[:value])
    @driver.find_element(@intro_text_header[:type], @intro_text_header[:value])
    @driver.find_element(@intro_text_footer[:type], @intro_text_footer[:value])
  end

  def close_intro
    @driver.find_element(@button_to_app[:type], @button_to_app[:value]).click
  end
end
