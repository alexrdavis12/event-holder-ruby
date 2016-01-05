class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :qid
      t.integer :eid
      t.text :qtitle
      t.string :qtype
      t.string :qoption
      t.integer :qparentid

      t.timestamps null: false
    end
  end
end
