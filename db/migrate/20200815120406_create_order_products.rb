class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :make_status, default: 0
      t.integer :quantity
      t.integer :purchase_price

      t.timestamps
    end
  end
end
