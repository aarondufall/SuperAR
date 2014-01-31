namespace :db do
	desc "Runs database migration"
  task :migrate do
  	require_relative 'app'

  	print "Creating database at #{SuperAR::Base.filename}...\n"
  	# Require all _migration.rb files in db/migration folder
		Dir[APP_ROOT.join('db','migrations','*_migration.rb')].each do |file|
			file_name = file.split('/').last.gsub(".rb","")
			puts "Requiring #{file_name}\n"
			require file 
			# convert filename to class name and run migration
			klass =	Object.const_get(SuperActionPack::Base.to_camel_case(file_name))
			klass.migrate
		end
  end
end


