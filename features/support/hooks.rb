require 'cucumber'
require 'watir'
require 'watir-scroll'
require 'parallel_tests'
require 'rspec'
require 'win32ole'
=begin

Before do |scenario|
  def browser
  @browser = Watir::Browser.new browser_name
  Watir.default_timeout = 10
  @browser.cookies.clear
  @browser.window.maximize
  end

  if  browser_name == :firefox
      Selenium::WebDriver::Firefox::Binary.path='C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
      browser

  elsif browser_name ==:ie
     IO.popen("C:\\Users\\ogboi\\OneDrive\\Documents\\GitHub\\LORA\\features\\support\\authwibdow.exe")
      browser

  elsif browser_name ==:chrome
      browser
  end


    if environment == :dev
      @browser.goto   "https://storefront:loreal1@dev23-emea-loreal.demandware.net/on/demandware.store/Sites-armani-jp-Site"
    elsif environment == :stg
      @browser.goto   "https://storefront:loreal1@staging.demandware.net/on/demandware.store/Sites-armani-jp-Site"
    elsif environment == :prod
    @browser.goto   "https://storefront:loreal1@production.demandware.net/on/demandware.store/Sites-armani-jp-Site"
    end

end


=end
After do |scenario|
  if scenario.failed?
    @browser.screenshot.save (scenario.name+".png")
    embed(scenario.name+".png", 'image/png')
  end
  @browser.quit
end
