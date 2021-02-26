class AddListContentToInventoryLists < ActiveRecord::Migration[6.1]
  def change
    add_column :inventory_lists, :list_content, :text
  end
end
