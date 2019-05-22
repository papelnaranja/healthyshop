class RemoveStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :status, :string
  end
end
