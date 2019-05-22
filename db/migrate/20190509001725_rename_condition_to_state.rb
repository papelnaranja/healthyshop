class RenameConditionToState < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :status, :state
  end
end
