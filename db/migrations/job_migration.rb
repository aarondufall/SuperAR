class JobMigration
	def self.migrate

	 SuperAR::Base.execute(<<-SQL)
      CREATE TABLE "jobs" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" varchar(255),
        "location" varchar(255),
        "email" varchar(255),
        "phone" varchar(255),
        "created_at" datetime NOT NULL,
        "updated_at" datetime NOT NULL
      );
    SQL
	end

end