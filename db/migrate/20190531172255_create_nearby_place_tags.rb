class CreateNearbyPlaceTags < ActiveRecord::Migration[5.2]
  def change
    create_table :nearby_place_tags do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
