class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :inventory_list

    validates :content, presence: true
end
