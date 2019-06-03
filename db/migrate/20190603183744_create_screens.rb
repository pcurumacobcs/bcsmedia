class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.references :screen_type, foreign_key: true
      t.references :screen_brand, foreign_key: true
      t.references :location, foreign_key: true
      t.string :code, null: false, default: ""
      t.string :model, null: false, default: ""
      t.string :sku, null: false, default: ""
      t.string :orientation, null: false, default: ""
      t.string :size_inches, null: false, default: "-"
      t.string :description, default: ""
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
