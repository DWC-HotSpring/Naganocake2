class RenameFamilyNameColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :family_name, :last_name
    rename_column :customers, :family_name_kana, :last_name_kana
  end
end
