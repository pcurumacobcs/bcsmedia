class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :tradename, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :nit, null: false, default: ""
      t.integer :customer_type, null: false, default: 1
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
