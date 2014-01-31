module SuperAR
	class Base
		def self.filename
			@filename
		end

		def self.database=(filename)
			@filename = filename.to_s
			@connection = SQLite3::Database.new(filename.to_s)

      @connection.results_as_hash  = true

      @connection.type_translation = true
		end

		def self.execute(sql)
			@connection.execute sql
		end


	  def set_attributes
	  	SuperAR::Base.execute("PRAGMA table_info(#{self.class.to_s.downcase + 's'})").each do |row|
	  		self.class.send(:define_method, "#{row["name"]}=") do |value|
	  			instance_variable_set("@#{row["name"]}", value)
	  		end

	  		self.class.send(:define_method, "#{row["name"]}") do
	  			instance_variable_get("@#{row["name"]}")
	  		end

	  	end
	  end

	  def initialize
	  	set_attributes
		end
	end
end