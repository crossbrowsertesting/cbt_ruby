module CBTRUBY
	class Base_query
	end

	class Screenshot_query < Base_query
		def initialize(client:)
			@client = client
		end
	end
end