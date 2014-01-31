require 'pathname'
require 'sqlite3'

# Sets application root path to current path
APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))
Dir[APP_ROOT.join('lib','*.rb')].each { |file| require file }

# Requires all *.rb file in the model folder
Dir[APP_ROOT.join('model','*.rb')].each { |file| require file }

# Require all _migration.rb files in db/migration folder
Dir[APP_ROOT.join('db','migrations','*_migration.rb')].each { |file| require file }



# Sets sqlite3 database file to db/app.db
DB_LOCATION	 = APP_ROOT.join('db', 'app.db')
SuperAR::Base.database = APP_ROOT.join('db', 'app.db')
