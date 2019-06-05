class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :company_industry, foreign_key: true
      t.string :name, null: false
      t.string :address, null: false, default: ""
      t.string :phone_number, null: false, default: ""
      t.string :web_site, null: false, default: ""

      t.timestamps
    end
  end
end
