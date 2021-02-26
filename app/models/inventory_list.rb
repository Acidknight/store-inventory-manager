class InventoryList < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :users_comments, through: :comments, source: :user

    validates :name, :item_count, :date, :time, :list_content, presence: true

    scope :alpha, -> { order('LOWER(name)') }

    def self.search(q)
        InventoryList.where("name LIKE ?", "%#{q}%").alpha
    end

    
end
