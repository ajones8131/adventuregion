# Adds the User Categories; Email, Password Digest, 
# and created_at coumns tpo the User table.

class CreateUsersCategories < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :created_at, :datetime
  end
end
