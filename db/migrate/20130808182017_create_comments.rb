class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user
      t.references :commentable, polymorphic: true

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :question_id
    add_index :comments, :answer_id
  end
end
