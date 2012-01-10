require "#{File.dirname(__FILE__)}/../Pages/Pages.Base.rb"
require "#{File.dirname(__FILE__)}/../Utilities/Common.rb"

class ParmLogin
  def self.set_username
    return USER_NAME
  end

  def self.set_empty_username
    return EMPTY_USER_NAME
  end

  def self.set_invalid_username
    return INVALID_USER_NAME
  end

  def self.set_password
    return PASS_WORD
  end

  def self.set_empty_password
    return EMPTY_PASS_WORD
  end

  def self.set_invalid_password
    return INVALID_PASS_WORD
  end



  private

  USER_NAME= "test"
  EMPTY_USER_NAME=""
  INVALID_USER_NAME="tringuyen"
  PASS_WORD= "test"
  EMPTY_PASS_WORD=""
  INVALID_PASS_WORD="invalid"

end