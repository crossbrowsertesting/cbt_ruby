module CBTRUBY
  class CbtClient::ScreenshotInfo
    def initialize(client:, session:)
      @client = client
      @session = session
    end

    def request
      @client.basic_request(url: "screenshots/#{@session}")
    end

    def running
      status = request
      #puts status
      status['versions'][0]['active']
    end
  end

  class CbtClient::ScreenshotVersionInfo < CbtClient::ScreenshotInfo
    def initialize(client:, session:, version:)
      @client = client
      @session = session
      @version = version
    end

    def request
      @client.basic_request(url: "screenshots/#{@session}/#{@version}")
    end
  end
end
