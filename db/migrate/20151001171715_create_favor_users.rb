class CreateFavorUsers < ActiveRecord::Migration
  def change
    create_table :favor_users, id: false do |t|
      t.integer :favor_id
      t.integer :user_id
      t.string :role
      t.text :notes

      t.timestamps null: false
    end
  end
end
