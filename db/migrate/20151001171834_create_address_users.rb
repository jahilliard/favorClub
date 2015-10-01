class CreateAddressUsers < ActiveRecord::Migration
  def change
    create_table :address_users, id: false do |t|
      t.integer :address_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
