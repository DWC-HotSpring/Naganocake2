class AddAveragerateToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :average_rate, :float, default: 0.0, null: false
  end
end
