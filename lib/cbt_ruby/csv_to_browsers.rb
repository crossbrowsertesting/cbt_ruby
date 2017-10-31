module CBTRUBY
  def self.csv_to_browsers(filename:)
    @browsers = CBTRUBY::CbtClient::Browsers.new
    CSV.foreach(filename, headers: true) do |row|
      @browsers.add(CBTRUBY::CbtClient::Browser.new(
                      browser: row['browser'],
                      version: row['version'],
                      platform: row['platform'],
                      resolution: row['resolution']
      ))
    end
    @browsers
  end
end

require 'csv'
