require 'watir-webdriver'
require 'selenium-webdriver'
include SauceLabs


Before do

  ENV['BROWSER'] = "chrome" if ENV['BROWSER'].nil?
  if(ENV['BROWSER']=='firefox')
    profile = Selenium::WebDriver::Firefox::Profile.from_name 'seleniumprofile'
    @browser = Watir::Browser.new :firefox, :profile => profile
  else
    @browser = Watir::Browser.new ENV['BROWSER'].to_sym
  end
  @browser.window.maximize
end


After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  @browser.cookies.clear
  @browser.quit

end



