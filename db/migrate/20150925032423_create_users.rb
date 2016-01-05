class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :lastname
      t.string :firstname
      t.string :gender
      t.string :type
      t.timestamps null: false
    end
  end
end
