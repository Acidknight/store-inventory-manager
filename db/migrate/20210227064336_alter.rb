class Alter < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, :inventory_lists
  end
end
