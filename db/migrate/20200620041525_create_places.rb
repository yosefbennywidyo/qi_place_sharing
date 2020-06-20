class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :lat, precision: 12, scale: 7, default: "0.0"
      t.string :lon, precision: 12, scale: 7, default: "0.0"
      t.boolean :public_status, default: false

      t.timestamps
    end
  end
end
