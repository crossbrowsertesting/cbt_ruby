module CBTRUBY
  class CbtClient::Browsers
    def initialize
      @browsers = []
    end

    # takes a CbtClient::Browser object as input and adds it to the list of browsers
    def add(browser)
      @browsers.push(browser)
    end

    def to_s
      @browsers.map(&:to_s).join(',')
    end
  end
end
