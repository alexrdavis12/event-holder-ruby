class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :eid
      t.integer :uid
      t.integer :qid
      t.string :answer

      t.timestamps null: false
    end
  end
end
