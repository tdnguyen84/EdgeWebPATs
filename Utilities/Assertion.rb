require 'test/unit'
require "#{File.dirname(__FILE__)}/../Utilities/Logger.rb"

=begin
Title: Customer Assertion to include Logger
Descriptions: this customer Assertions behaves the same as built-in Assertions in Ruby exceptions an addition to log message
      - method_name is optional, its presence is to allow Unit test method an option to include its name into log info
      - the custom assert can also have an ability to log to logger when passing
      - msg_if_pass: message to log to Logger  if test is passed
      - msg_if_fail: message to log to Logger  if test is failed
Observations:
Requirements: Built-in Assertions module in Ruby
Created By: Trung Huynh
Created Date: 2011-12-17
Modification History:
Modified by Date:
Notes: developers should define more custom assertions statements during writing PAT
=end

module LogAssertions
  def assert_true(test, msg_if_pass = (nomsg = true; nil), msg_if_fail = (nomsg = true; nil), method_name = nil)
      if !test
        if method_name != nil
          Log.error(method_name, msg_if_fail)
          assert(false, msg_if_fail)
          return
        else
          Log.error(msg_if_fail)
          assert(false, msg_if_fail)
        end
      else
        method_name != nil ? (Log.info(method_name, msg_if_pass) ; assert(true, "")): Log.info(msg_if_pass)
      end
  end
end