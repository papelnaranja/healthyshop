class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.float :longitude
      t.float :latitude
      t.string :name
      t.string :photo
      t.string :description
      t.string :status
      t.string :address

      t.timestamps
    end
  end
end
