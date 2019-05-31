class CreateLocationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :location_types do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
