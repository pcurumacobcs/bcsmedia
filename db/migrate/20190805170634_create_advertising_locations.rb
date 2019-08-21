class CreateAdvertisingLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :advertising_locations do |t|
      t.references :advertisements, foreign_key: { on_delete: :cascade }
      t.references :locations, foreign_key: { on_delete: :cascade }
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
