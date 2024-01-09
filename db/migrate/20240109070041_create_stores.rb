class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      
      t.string :name, null: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
