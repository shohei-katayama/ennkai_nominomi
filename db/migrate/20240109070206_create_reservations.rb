class CreateResevations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      
      t.integer :customer_id, null: false
      t.integer :store_id, null: false
      t.integer :day, null: false
      t.integer :time, null: false

      t.timestamps
    end
  end
end
