require 'webdrivers'
require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UntitledTestCase" do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_untitled_test_case" do
    @driver.get "http://127.0.0.1:3000/palindrome/input"
    @driver.find_element(:id, "num").click
    @driver.find_element(:id, "num").clear
    @driver.find_element(:id, "num").send_keys "6565"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:id, "result").text).should == "1 1\n3 11\n5 101\n7 111\n9 1001\n33 100001\n99 1100011\n313 100111001\n585 1001001001\n717 1011001101"
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end