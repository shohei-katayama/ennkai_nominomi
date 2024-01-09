class CreateResevationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_details do |t|
      
      t.integer :reservation_id, null: false
      t.integer :store_id, null: false
      t.integer :people, null: false

      t.timestamps
    end
  end
end
