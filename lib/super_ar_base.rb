module SuperAR
	class Base
		def self.filename
			@filename
		end

		def self.database=(filename)
			@filename = filename.to_s
			@connection = SQLite3::Database.new(filename.to_s)
		end

		def self.execute(sql)
			@connection.execute sql
		end
	end
end