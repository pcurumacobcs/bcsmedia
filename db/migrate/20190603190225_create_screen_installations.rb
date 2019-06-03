class CreateScreenInstallations < ActiveRecord::Migration[5.2]
  def change
    create_table :screen_installations do |t|
      t.references :screen, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.datetime :date, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.string :description, default: ""

      t.timestamps
    end
  end
end
