class FixColumnnames < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :list_id, :inventory_list_id
  end
end
