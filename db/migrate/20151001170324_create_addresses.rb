class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :description
      t.string :streetAddress
      t.string :city
      t.integer :zipCode
      t.string :state
      t.float :long
      t.float :lat

      t.timestamps null: false
    end
  end
end
