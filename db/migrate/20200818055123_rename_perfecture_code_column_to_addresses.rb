class RenamePerfectureCodeColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :perfecture_code, :prefecture_code
  end
end
