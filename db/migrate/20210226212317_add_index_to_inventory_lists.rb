class AddIndexToInventoryLists < ActiveRecord::Migration[6.1]
  def change
    add_index :inventory_lists, :user_id
  end
end
