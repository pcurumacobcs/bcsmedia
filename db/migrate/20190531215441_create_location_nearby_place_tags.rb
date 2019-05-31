class CreateLocationNearbyPlaceTags < ActiveRecord::Migration[5.2]
  def change
    create_table :location_nearby_place_tags do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.references :nearby_place_tag, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
