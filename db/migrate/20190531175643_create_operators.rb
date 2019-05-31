class CreateOperators < ActiveRecord::Migration[5.2]
  def change
    create_table :operators do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number, null: false
      t.string :position, null: false
      t.string :description
      t.integer :type_operator, null: false, default: 1
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
