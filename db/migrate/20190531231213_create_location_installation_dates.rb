class CreateLocationInstallationDates < ActiveRecord::Migration[5.2]
  def change
    create_table :location_installation_dates do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.datetime :date_time, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.text :comments

      t.timestamps
    end
  end
end
