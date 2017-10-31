Gem::Specification.new do |s|
	s.name = "cbt_ruby"
	s.version = "0.0.5"
	s.date = "2017-10-31"
	s.summary = "A gem for interacting with the CrossBrowserTesting.com API"
	s.authors = ["Harold Schreckengost"]
	s.email = ["harolds@crossbrowsertesting.com"]
	s.files = ["lib/cbt_ruby.rb", 
		"lib/cbt_ruby/browser.rb", 
		"lib/cbt_ruby/browsers.rb", 
		"lib/cbt_ruby/screenshot_info.rb", 
		"lib/cbt_ruby/screenshot_test.rb",
		"lib/cbt_ruby/screenshot_history.rb",
		"lib/cbt_ruby/browser_queries.rb",
		"lib/cbt_ruby/csv_to_browsers.rb"]
	s.homepage = "https://github.com/crossbrowsertesting/cbt_ruby"
end