class AddIndexToComments < ActiveRecord::Migration[6.1]
  def change
    add_index :comments, :list_id
    add_index :comments, :user_id
  end
end
