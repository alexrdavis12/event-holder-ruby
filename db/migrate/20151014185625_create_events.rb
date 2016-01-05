class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :eid
      t.string :etitle
      t.string :elocation
      t.date :estart
      t.date :eend
      t.text :edescription

      t.timestamps null: false
    end
  end
end
