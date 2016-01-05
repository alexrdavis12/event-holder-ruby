class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :users, :password
  end
end
