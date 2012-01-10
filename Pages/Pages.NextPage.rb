require "#{File.dirname(__FILE__)}/Pages.Base.rb"
require "#{File.dirname(__FILE__)}/../Utilities/Common.rb"

class NextPage < BrowserContainer
  def loggedin?
    logged_in_element.exists?
  end

  def empty_user_message?
    warn_emptyuser_message.exists?
  end

  def empty_pass_message?
    warn_emptypass_message.exists?
  end

  def invalid_pass_message?
    warn_invalid_message.exists?
  end

  def invalid_user_message?
    warn_invalid_message.exists?
  end

  private
  def logged_in_element
    @browser.div(:id,"logo_right")
  end

  def warn_emptyuser_message
    @browser.span(:text,"Please enter your username")
  end

  def warn_emptypass_message
    @browser.span(:text,"Please enter your password")
  end

  def warn_invalid_message
    @browser.span(:text,"Authentication failed")
  end
end