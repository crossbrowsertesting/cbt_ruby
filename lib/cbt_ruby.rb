require 'net/http'
require 'uri'
require 'json'

module CBTRUBY
  CBT_API = 'https://crossbrowsertesting.com/api/v3/'.freeze
  POST = 'post'.freeze
  GET = 'get'.freeze

  # Core class for the gem.
  class CbtClient
    # Initialize the CBT client object using username and authkey
    def initialize(username, authkey)
      @username = username
      @authkey = authkey
    end

    # Base for making API requests
    # Returns a hash table
    def basic_request(url:, reqMethod: 'get', data: nil)
      uri = URI.parse(CBT_API + url)

      # Set request method
      case reqMethod
      when 'post'
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(data)
      when 'get'
        uri.query = URI.encode_www_form(data) unless data.nil?
        request = Net::HTTP::Get.new(uri)
      end

      request.basic_auth(@username, @authkey)

      req_options = {
        use_ssl: uri.scheme == 'https'
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      if response.code == '200'
        return JSON.parse(response.body)
      else
        puts response.code
        puts response.body
        abort('Invalid Response')
      end
    end
  end
end

require_relative 'cbt_ruby/browser'
require_relative 'cbt_ruby/browsers'
require_relative 'cbt_ruby/screenshot_info'
require_relative 'cbt_ruby/screenshot_test'
require_relative 'cbt_ruby/csv_to_browsers.rb'
require_relative 'cbt_ruby/browser_queries.rb'
require_relative 'cbt_ruby/screenshot_history.rb'
