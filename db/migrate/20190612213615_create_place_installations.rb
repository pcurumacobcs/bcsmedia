class CreatePlaceInstallations < ActiveRecord::Migration[5.2]
  def change
    create_table :place_installations do |t|
      t.references :screen, foreign_key: { on_delete: :cascade }
      t.integer :type, null: false, default: "1"
      t.string :nids, null: false, default: "300"
      t.boolean :antireflective, null: false, default: false

      t.timestamps
    end
  end
end
