# Database migration that creates the table for the User Database.  It
# Populates the table with the name, email, created_at, updated_at,
# password_digest, and remember_digest

class CreateUsers < ActiveRecord::Migration
 	def change
		create_table "users", force: true do |table|
	    	table.string   "name"
	    	table.string   "email"
	   	 	table.datetime "created_at"
	    	table.datetime "updated_at"
	    	table.string   "password_digest"
	    	table.string   "remember_digest"
    	end
    end
end