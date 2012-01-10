require "#{File.dirname(__FILE__)}/../Pages/Site.rb"

class Common
  def self.get_browser_name
    if ARGV[0]!= nil
      return ARGV[0]
    else
      return "ie"
    end

  end

  def self.open_browser(browser_name)

    case browser_name
      when "ff"
        $site=Site.new(Watir::Browser.new(:ff))
      when "ie"
        $site=Site.new(Watir::Browser.new(:ie))
      when "chrome"
        $site=Site.new(Watir::Browser.new(:chrome))
      else
        $site=Site.new(Watir::Browser.new(:ff))
    end
  end
end