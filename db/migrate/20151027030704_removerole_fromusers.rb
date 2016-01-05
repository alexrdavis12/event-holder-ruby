class RemoveroleFromusers < ActiveRecord::Migration
 def up
    remove_column :users, :role, :string
  end
end
