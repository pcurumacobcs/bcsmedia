class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :description
      t.string :slug, null: false, index: { unique: true }
      t.integer :lavel, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
