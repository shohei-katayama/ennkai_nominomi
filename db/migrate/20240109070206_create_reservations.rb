class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.integer :customer_id, null: false
      t.integer :store_id, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :telephone_number, null: false
      t.string :guests, null: false
      t.boolean :temporary_flg, default: true, null: false

      t.timestamps
    end
  end
end
