class Salt < ActiveRecord::Migration
  def up
  	add_column :users, :salt, :string
  end
end
