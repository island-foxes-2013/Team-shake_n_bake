class AddBestanswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :best_answer, :boolean
  end
end
