class AddQtitleToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :qtitle, :string
  end
end
