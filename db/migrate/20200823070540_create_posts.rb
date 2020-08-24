class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.float :rate, null: false, default: 0
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
