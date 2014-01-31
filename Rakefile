require_relative 'app'

namespace :db do
  task :migrate do
		desc "Runs database migration"

  	print "Creating database at #{SuperAR::Base.filename}...\n"
  	# Require all _migration.rb files in db/migration folder
		Dir[APP_ROOT.join('db','migrations','*_migration.rb')].each do |file|
			file_name = file.split('/').last.gsub(".rb","")
			puts "Creating table for #{file_name}\n"
			require file 
			# convert filename to class name and run migration
			klass =	Object.const_get(SuperActionPack::Base.to_camel_case(file_name))
			klass.migrate
		end
  end

  task :drop do
  	desc "Drops all tables from database"
  	FileUtils.remove_file(DB_LOCATION)
  end

  task :table_list do
  	SuperAR::Base.table_list("jobs") 
  end
end


task :console do
	exec 'irb -r ./app.rb'
end




