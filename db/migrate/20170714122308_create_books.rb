class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :author
      t.integer :status

      t.timestamps
    end
  end
end
