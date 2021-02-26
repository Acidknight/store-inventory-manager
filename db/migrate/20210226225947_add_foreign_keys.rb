class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :inventory_lists 
    add_foreign_key :comments, :users
    add_foreign_key :inventory_lists, :users
  end
end
