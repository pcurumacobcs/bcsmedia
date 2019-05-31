class CreateLocationOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :location_operators do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.references :operator, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
