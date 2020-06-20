class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :lat
      t.string :lon
      t.boolean :public_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
