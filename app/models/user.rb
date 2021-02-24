class User < ApplicationRecord
    has_secure_password
    has_many :inventory_lists
    has_many :items, through: :inventory_lists

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end

