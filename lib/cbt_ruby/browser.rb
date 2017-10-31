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
        string = "#{@browser}#{@version}"
        return string
      else
        string = "#{@platform}|#{@browser}#{@version}"
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
