class CreatePlacePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :place_permissions do |t|

      t.timestamps
    end
  end
end
