class InventoryList < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :users_comments, through: :comments, source: :user

    validates :name, :item_count, :date, :time, presence: true
end
