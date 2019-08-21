class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.integer :customer_id, :limit => 8
      t.integer :contact_id, :limit => 8
      t.integer :company_id, :limit => 8
      t.references :user, foreign_key: true
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
