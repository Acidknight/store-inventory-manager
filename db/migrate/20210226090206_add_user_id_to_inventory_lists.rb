class AddUserIdToInventoryLists < ActiveRecord::Migration[6.1]
  def change
    add_column :inventory_lists, :user_id, :integer
  end
end
