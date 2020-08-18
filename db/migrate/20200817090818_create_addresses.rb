class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customers_id
      t.string :post_code
      t.integer :perfecture_code
      t.string :city
      t.string :block
      t.string :name
      t.string :phone_number
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
