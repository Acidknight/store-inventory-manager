class InventoryList < ApplicationRecord
    has_many :items
    has_many :users, through: :items

    validates :name, :item_count, :date, :time, presence: true
end
