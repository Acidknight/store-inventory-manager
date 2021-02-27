class AddForeignKeyWithDestroy < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :inventory_lists, on_delete: :cascade
  end
end
