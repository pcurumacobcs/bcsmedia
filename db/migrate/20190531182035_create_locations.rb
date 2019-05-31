class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :location_type, foreign_key: true
      t.string :business_email
      t.string :lat
      t.string :lng
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
