class RenameConditionToStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :condition, :status
  end
end
