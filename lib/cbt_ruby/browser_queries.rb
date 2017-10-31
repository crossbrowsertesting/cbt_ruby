module CBTRUBY
  class CbtClient::BaseBrowserQuery
    def initialize(client:)
      @client = client
    end

    def search_devices
      # TODO: Implement Device Search
    end

    def search_browsers
      # TODO: Implement browser search
    end
  end

  class CbtClient::ScreenshotBrowserQuery < CbtClient::BaseBrowserQuery
    def list_all
      @client.basic_request(url: 'screenshots/browsers')
    end
  end

  class CbtClient::SeleniumBrowserQuery < CbtClient::BaseBrowserQuery
    def list_all
      @client.basic_request(url: 'selenium/browsers')
    end
  end
end
