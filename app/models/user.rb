class User < ApplicationRecord
    has_secure_password
    has_many :inventory_lists
    has_many :comments
    has_many :list_comments, through :inventory_lists, source: :comments

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end

