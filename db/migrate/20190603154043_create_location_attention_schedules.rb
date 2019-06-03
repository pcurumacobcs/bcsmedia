class CreateLocationAttentionSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :location_attention_schedules do |t|
      t.references :location, foreign_key: { on_delete: :cascade }
      t.integer :day, null: false
      t.column :start_hour, :time, null: false, default: "00:00"
      t.column :end_hour, :time, null: false, default: "23:59"

      t.timestamps
    end
  end
end
