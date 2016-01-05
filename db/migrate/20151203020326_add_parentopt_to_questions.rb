class AddParentoptToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :parentopt, :integer
  end
end
