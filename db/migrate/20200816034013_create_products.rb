class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :genre_id
      t.boolean :is_active
      t.string :image_id
      t.text :description

      t.timestamps
    end
  end
end
