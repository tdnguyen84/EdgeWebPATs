require "#{File.dirname(__FILE__)}/Pages.Base.rb"
require "#{File.dirname(__FILE__)}/../Utilities/Common.rb"
require "#{File.dirname(__FILE__)}/Pages.NextPage.rb"

class LoginPage < BrowserContainer
  def goto_login_page
    @browser.goto URL_PAGE
    self
  end

  def login_click(user,pass)
    user_field.set user
    pass_field.set pass
    login_button.click
  end

  def login_success


    Watir::Wait.until {next_page.loggedin?}
    return next_page


  end

  def login_empty_username

      Watir::Wait.until{next_page.empty_user_message?}
      return next_page

  end

  def login_empty_pass


      Watir::Wait.until{next_page.empty_pass_message?}
      return next_page

  end

  def login_invalid_pass


      Watir::Wait.until{next_page.invalid_pass_message?}
      return next_page

  end

  def login_invalid_user

      Watir::Wait.until{next_page.invalid_user_message?}
      return next_page

  end


  private
  def next_page
    page=NextPage.new(@browser)
    return page
  end
  def user_field
    @browser.text_field(:id,"usernameTextBox")
  end

  def pass_field
    @browser.text_field(:id,"passwordTextBox")
  end

  def login_button
    @browser.div(:id,"login_button")
  end

  URL_PAGE="http://10.10.248.101/"
end
