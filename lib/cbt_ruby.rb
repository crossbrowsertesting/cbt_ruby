require 'net/http'
require 'uri'
require 'json'

module CBTRUBY

	CBT_API = 'https://crossbrowsertesting.com/api/v3/'.freeze
	POST="post"
	GET="get"

	#Core class for the gem.
	class CbtClient

		# Initialize the CBT client object using username and authkey
		def initialize(username, authkey)
			@username = username
			@authkey = authkey
		end

		# Base for making API requests
		# Returns a hash table
		def basicRequest(url:, reqMethod: "get", data: {"blank" => "blank"})
			unless data["blank"] == "blank"
				query = data
			else
				query = {}
			end
			uri = URI.parse(CBT_API + url)

			# Set request method
			case reqMethod
			when "post"
				request = Net::HTTP::Post.new(uri)
				request.set_form_data(data)
			when "get"
				uri.query = URI.encode_www_form(query)
				request = Net::HTTP::Get.new(uri)
			end

			request.basic_auth(@username, @authkey)

			req_options = {
				use_ssl: uri.scheme == "https",
			}	

			response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
				http.request(request)
			end

			if response.code == "200"
				return JSON.parse(response.body)
			end
		end


		#Take a hash and find all browser combos matching it.
		#def searchBrowsers(list, criteria)
			#TODO: Build search functionality

		#end

		#SCREENSHOTS
		# Functionality regarding the CBT screenshot API

		# Return a hash table containing all browesrs from our API
		def screenshotBrowsers
			return self.basicRequest(url: "screenshots/browsers")
		end

		

		#Get the history of screenshot tests.  Accepts the following parameters as a single hash:
		# num - number of results to return
		# start - start index of results
		# active - boolean, should only active or inactive tests be returned
		# url - URL from screenshot test
		# start_date (Format: YYYY-MM-DD)
		# end_date (Format: YYYY-MM-DD)
		# archived - boolean, include only archived or unarchived results
		def screenshotHistory(params:{})
			return self.basicRequest(url: "screenshots", data: params)
		end

		# Initiate a screenshot test
		# Takes the following parameters
		# params {}
		# ---------
		# url (REQUIRED)- the URL to initiate the screenshot test for
		# browsers (REQUIRED if no browser_list_name)- an array of hashes of format {"browser" => "X", "platform" => "Y", "resolution" => "Z" (platform and resolution are not required)}
		# browser_list_name (REQUIRED if no browsers) - a string of a browser_list on CBT
		# login - login profile name to use
		# basic_username - authentication to use for basic HTTP auth in the request
		# basic_password - authentication to use for basic HTTP auth in the request
		# delay - set a load delay before starting the screenshotting
		# hide_fixed_elements - boolean (default true)
		# check_url - boolean (default true)
		# send_email - boolean (default false)
		# email_list - an array of email addresses to notify when completed
		# ---------
		# blocking - do not return until this test is completed (useful for testing multiple URLs)
		def screenshotTest(params:{}, blocking: true)
			testReq = self.basicRequest(url:"screenshots", reqMethod: POST, data: params)
			if blocking
				#TODO : ADD IN THE BLOCKING CODE		
			end
		end
	end
end