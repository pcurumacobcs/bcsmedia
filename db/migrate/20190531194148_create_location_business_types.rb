class CreateLocationBusinessTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :location_business_types do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.references :business_type, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
