class InventoryList < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :users_comments, through: :comments, source: :user

    scope :alpha, -> { order('LOWER(name)') }

    validates :name, :item_count, :date, :time, :list_content, presence: true
end
