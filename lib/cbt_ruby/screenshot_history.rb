module CBTRUBY
  class CbtClient::ScreenshotHistory
    def initialize(client:)
      @client = client
    end

    def list(params: nil)
      @client.basic_request(url: 'screenshots', data: params)
    end
  end
end
