class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :phone_number, null: false, default: ""
      t.string :cell_phone_number, null: false, default: ""
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
