class AddViewToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :view, :integer
  end
end
