class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :item
      t.text :description
      t.float :price
      t.integer :requestLive
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
