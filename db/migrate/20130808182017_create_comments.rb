class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :question
      t.references :user
      t.references :answer
      t.string :content

      t.timestamps
    end
    add_index :comments, :question_id
    add_index :comments, :user_id
    add_index :comments, :answer_id
  end
end
