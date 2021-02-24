class Item < ApplicationRecord

    validates :name, :quantity, :category, :location, presence: true

    belongs_to :user 
    belongs_to :inventory_list
end
