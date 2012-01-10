require "#{File.dirname(__FILE__)}/Pages.Base.rb"
require "#{File.dirname(__FILE__)}/../Utilities/Common.rb"
require "#{File.dirname(__FILE__)}/Pages.Login.rb"
require "#{File.dirname(__FILE__)}/Pages.NextPage.rb"

class Site < BrowserContainer
  def login_page
    @login_page= LoginPage.new(@browser)
  end

  def next_page
    @next_page = NextPage.new(@browser)
  end
end