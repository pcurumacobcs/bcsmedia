class CreateLocationPhones < ActiveRecord::Migration[5.2]
  def change
    create_table :location_phones do |t|
      t.references :location, foreign_key: true
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
