class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :role, :integer, default: 2
  end
end
