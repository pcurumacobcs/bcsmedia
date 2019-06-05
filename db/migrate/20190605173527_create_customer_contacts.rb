class CreateCustomerContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_contacts do |t|
      t.references :customer, foreign_key: { on_delete: :cascade }
      t.references :contact, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
