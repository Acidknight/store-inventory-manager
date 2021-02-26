class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :list_id
      t.belongs_to :user, null: false, foreigh_key: true
      t.belongs_to :inventory_list, null: false, foreigh_key: true

      t.timestamps
    end
  end
end
