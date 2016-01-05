class Renameattribute < ActiveRecord::Migration
  	def self.up
    rename_column :users, :type, :role
  end



end
