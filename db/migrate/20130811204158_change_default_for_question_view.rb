class ChangeDefaultForQuestionView < ActiveRecord::Migration
  def change
  	change_column :questions, :view, :integer, :default => 0
  end
end
