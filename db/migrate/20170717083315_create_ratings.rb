class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :mark

      t.timestamps
    end

    add_index :ratings, [:user_id, :book_id], unique: true
  end
end
