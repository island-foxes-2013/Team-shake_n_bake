class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.references :user
  end
end

end
