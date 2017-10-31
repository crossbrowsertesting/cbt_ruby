

module CBTRUBY
  # Provides a simple interface to the CBT API for performing screenshot tests
  class CbtClient::ScreenshotTest
    # Set up the screenshot test

    def initialize(client:, params:, block: true)
      @input_params = params
      # puts @input_params[:url]
      @params = @input_params
      format_params
      # puts @params[:browsers]
      @client = client
      @block = block

      self.begin
    end

    # Format parameters for passing on
    def format_params
      @params[:browsers] = @params[:browsers].to_s if @params[:browsers]

      if @params[:email_list]
        @params[:email_list] = @params[:email_list].join(',')
      end
    end

    def begin
      @test = @client.basic_request(url: 'screenshots', reqMethod: POST, data: @params)
      # puts @test
      @info = CBTRUBY::CbtClient::ScreenshotInfo.new(client: @client, session: @test['screenshot_test_id'])
      if @block
        @running = true
        wait_for_finish
      end
      @info.request
    end

    # Block until test is finished
    def wait_for_finish
      while @running
        sleep 15
        @running = @info.running
      end
    end
  end
end

require_relative 'screenshot_info'
