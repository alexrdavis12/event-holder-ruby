class RemoveRole < ActiveRecord::Migration
  def up
  	remove_column :users, :role
  end
end
