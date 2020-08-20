class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_status, default: 0
      t.string :addressee
      t.string :post_code
      t.integer :prefecture_code
      t.string :city
      t.string :block
      t.integer :postage, default: 800
      t.integer :billing_amount
      t.integer :payment_method

      t.timestamps
    end
  end
end
