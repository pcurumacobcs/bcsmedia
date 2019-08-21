class CreateAdvertisingLocationScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :advertising_location_screens do |t|
      t.references :advertisements, foreign_key: { on_delete: :cascade }
      t.references :advertising_locations, foreign_key: { on_delete: :cascade }
      t.references :screen, foreign_key: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
