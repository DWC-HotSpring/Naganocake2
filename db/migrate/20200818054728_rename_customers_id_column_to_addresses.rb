class RenameCustomersIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :customers_id, :customer_id
  end
end
