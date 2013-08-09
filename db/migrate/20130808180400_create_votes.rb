class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :votetable, polymorphic: true

      t.timestamps
    end
    # add_index :votes, :user_id
  end
end
