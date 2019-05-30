class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :description
      t.string :slug, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
