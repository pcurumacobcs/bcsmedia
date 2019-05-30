class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :username, null: false, index: {unique: true}
      t.string :email, null: false, index: {unique: true}
      t.string :password_digest, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
