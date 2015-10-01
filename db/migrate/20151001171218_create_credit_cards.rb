class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :csv
      t.string :fname
      t.string :lname
      t.integer :expmonth
      t.integer :expyear
      t.integer :number
      t.integer :user_id
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
