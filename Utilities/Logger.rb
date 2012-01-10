require "logger"
require 'test/unit'
require "#{File.dirname(__FILE__)}/Assertion.rb"
#include LogAssertions
include Test::Unit::Assertions

=begin
Title: Wrapper class for logging
Descriptions:
      - this wrapper class uses logger library of Ruby for logging
      - Usage:
        Log.info(method_name, message)
        or
        Log.info(message)
Observations:
Requirements: logger library in Ruby
Created By: Trung Huynh
Created Date: 2011-12-16
Modification History:
Modified by Date:
Notes:
=end

class Log

  #@@log = Logger.new(STDOUT)
  @@logfile = "#{File.dirname(__FILE__)}/../Logs/" + Time.now.strftime("%m-%d-%Y") + "Log.log"
  @@log = Logger.new(@@logfile, "weekly")
  @@log.level = Logger::DEBUG

  def initialize (logdev=STDOUT, shift_age = 7, shift_size = 1048576)
    @@log = Logger.new(logdev)
    @@log.level = Logger::INFO
  end

  def self.debug(*methodname, msg)
    if methodname.length>0 ; @@log.debug(methodname) {msg} ; end
    if methodname.length==0 ; @@log.debug(msg) ; end
  end

  def self.info(*methodname, msg)
    if methodname.length>0 ; @@log.info(methodname) {msg} ; end
    if methodname.length==0 ; @@log.info(msg) ; end
  end

  def self.warn(*methodname, msg)
    if methodname.length>0 ; @@log.warn(methodname) {msg} ; end
    if methodname.length==0 ; @@log.warn(msg) ; end
  end

  def self.error(*methodname, msg)
    if methodname.length>0 ; _a=@@log.error(methodname) {msg} ; end
    if methodname.length==0 ; _a=@@log.error(msg) ; end
    return _a
  end

  def self.fatal(*methodname, msg)
    if methodname.length>0 ; @@log.fatal(methodname) {msg} ; end
    if methodname.length==0 ; @@log.fatal(msg) ; end
  end

  def self.level=value
    case value.downcase
      when "debug" ; @@log.level = Logger::DEBUG
      when "info" ; @@log.level = Logger::INFO
      when "warn" ; @@log.level = Logger::WARN
      when "error" ; @@log.level = Logger::ERROR
      when "fatal" ; @@log.level = Logger::FATAL
      else @@log.level = Logger::INFO
    end
  end

  def self.exception(e)
    e.instance_of?(MiniTest::Assertion) ? assert(false, "") : Log.error(e)
  end
end