class AddConditionToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :condition, :integer, default: 0
  end
end
