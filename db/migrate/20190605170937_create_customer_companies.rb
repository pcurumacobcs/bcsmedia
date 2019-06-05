class CreateCustomerCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_companies do |t|
      t.references :customer, foreign_key: { on_delete: :cascade }
      t.references :company, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
