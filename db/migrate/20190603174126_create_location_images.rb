class CreateLocationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :location_images do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.string :url_image, null: false

      t.timestamps
    end
  end
end
