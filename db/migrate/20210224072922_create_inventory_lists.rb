class CreateInventoryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_lists do |t|
      t.string :name
      t.integer :item_count
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
