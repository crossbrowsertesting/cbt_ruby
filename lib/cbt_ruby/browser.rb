module CBTRUBY
  class CbtClient::Browser
    def initialize(browser:, version:, platform: nil, resolution: nil)
      @browser = browser
      @version = version
      @platform = platform
      @resolution = resolution
    end

    def to_s
      if @platform.nil?
        string = "#{@platform}|#{@browser}#{@version}"
      else
        string = "#{@browser}#{@version}"
        return string
      end
      if @resolution.nil?
        return string
      else
        string += "|#{@resolution}"
        return string
      end
    end
  end
end
