module CBTRUBY
	def self.csv_to_browsers(file:)
		@browsers = CBTRUBY::CbtClient::Browsers.new
		CSV.foreach(file, :headers => true) do |row|
			@browsers.add(CBTRUBY::CbtClient::Browser.new(
				browser: row["browser"],
				version: row["version"],
				platform: row["platform"],
				resolution: row["resolution"]
				))
		end
		return @browsers
	end

end

require 'csv'