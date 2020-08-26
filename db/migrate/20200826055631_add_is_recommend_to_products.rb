class AddIsRecommendToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :is_recommend, :boolean, null: false, default: false
  end
end
