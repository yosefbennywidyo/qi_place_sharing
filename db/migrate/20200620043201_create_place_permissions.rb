class CreatePlacePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :place_permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.integer :share_with, array: true, default: []

      t.timestamps
    end
  end
end
