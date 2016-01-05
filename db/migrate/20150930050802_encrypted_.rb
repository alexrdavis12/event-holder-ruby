class Encrypted < ActiveRecord::Migration
  def up
  	add_column :users, :encrypted_password, :string
  end
end
