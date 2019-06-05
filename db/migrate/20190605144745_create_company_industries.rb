class CreateCompanyIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :company_industries do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
