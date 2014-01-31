require 'pathname'
require 'sqlite3'

# Sets application root path to current path
APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

# Requires all *.rb file in the model folder
Dir[APP_ROOT.join('model','*.rb')].each do |file| 
	require file
end 

# Sets sqlite3 database file to db/app.db
# This will raise an error if the database has not yet been created
 SuperAR::Base.database = APP_ROOT.join('db', 'app.db')
