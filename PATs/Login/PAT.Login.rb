require "watir-webdriver"
require "test/unit"
require "C:/Ruby193/lib/ruby/1.9.1/test/unit.rb"
require "#{File.dirname(__FILE__)}/../../Utilities/Common.rb"
require "#{File.dirname(__FILE__)}/../../Pages/Pages.Base.rb"

require "#{File.dirname(__FILE__)}/../../Pages/Pages.NextPage.rb"
require "#{File.dirname(__FILE__)}/../../Pages/Pages.Login.rb"
require "#{File.dirname(__FILE__)}/../../Pages/Site.rb"
require "#{File.dirname(__FILE__)}/../../Utilities/Assertion.rb"
require "#{File.dirname(__FILE__)}/../../Parms/Parms.Login.rb"
require "#{File.dirname(__FILE__)}/../../Utilities/Logger.rb"
include Watir
include LogAssertions

class A01Login < Test::Unit::TestCase
   @@specified_browser = Common.get_browser_name

 def setup

   if $site == nil
      Common.open_browser @@specified_browser
    end
    @@login_page=$site.login_page.goto_login_page
  end

  def test_01_login
    begin
    Log.info(__method__.to_s,"Open Edge Web page")

    Log.info("Login with username: #{ParmLogin.set_empty_username()} and pwd: #{ParmLogin.set_password()}")
    @@login_page.login_click ParmLogin.set_empty_username, ParmLogin.set_password
    @final=@@login_page.login_empty_username

    assert_true(@final.empty_user_message?,"Test Case - Login with empty username: Passed","Test Case - Login with empty username: Failed",__method__)
    rescue Exception=>e
      Log.exception(e)
      raise Exception
    end
  end

  def test_02_login
    begin
    Log.info("Login with username: #{ParmLogin.set_username()} and pwd: #{ParmLogin.set_empty_password()}")
    @@login_page.login_click(ParmLogin.set_username, ParmLogin.set_empty_password)
    @final=@@login_page.login_empty_pass

    assert_true(@final.empty_pass_message?,"Test Case - Login with empty password: Passed","Test Case - Login with empty username: Failed",__method__)
    rescue Exception=>e
      Log.exception(e)
      raise Exception
    end

  end
  def test_03_login
    begin
    Log.info("Login with username: #{ParmLogin.set_username()} and pwd: #{ParmLogin.set_invalid_password()}")
    @@login_page.login_click(ParmLogin.set_username, ParmLogin.set_invalid_password)
    @final=@@login_page.login_invalid_pass

    assert_true(@final.invalid_pass_message?,"Test Case - Login with invalid password: Passed","Test Case - Login with invalid password: Failed",__method__)
    rescue Exception=>e
      Log.exception(e)
      raise Exception
    end
  end
  def test_04_login
    begin
    Log.info("Login with username: #{ParmLogin.set_invalid_username()} and pwd: #{ParmLogin.set_password()}")
    @@login_page.login_click(ParmLogin.set_invalid_username, ParmLogin.set_password)
    @final=@@login_page.login_invalid_user

    assert_true(@final.invalid_user_message?,"Test Case - Login with invalid username: Passed","Test Case - Login with invalid username: Failed",__method__)
    rescue Exception=>e
      Log.exception(e)
      raise Exception
    end
  end
  def test_05_login
    begin
    Log.info("Login with username: #{ParmLogin.set_username()} and pwd: #{ParmLogin.set_password()}")
    @@login_page.login_click(ParmLogin.set_username, ParmLogin.set_password)
    @final=@@login_page.login_success

    assert_true(@final.loggedin?,"Test Case - Login with valid username and password: Passed","Test Case - Login with valid username and password: Failed",__method__)
    rescue Exception=>e
      Log.exception(e)
      raise Exception
    end
   end
end