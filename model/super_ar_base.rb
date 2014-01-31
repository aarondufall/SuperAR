module SuperAR
	class Base
		def self.database=(filename)
			puts filename
			@connection = SQLite3::Database.new(filename.to_s)
		end
	end
end