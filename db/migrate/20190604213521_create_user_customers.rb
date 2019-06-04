class CreateUserCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_customers do |t|
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :customer, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
