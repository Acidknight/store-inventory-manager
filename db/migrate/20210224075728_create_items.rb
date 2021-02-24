class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :list_id
      t.string :name
      t.integer :quantity
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
