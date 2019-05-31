class CreateBusinessTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :business_types do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :description

      t.timestamps
    end
  end
end
