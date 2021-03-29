class User < ApplicationRecord
    has_secure_password
    validates :name, :username, :password, :group, presence: true
    validates :username, uniqueness: true

    has_many :posts
    has_many :comments through :posts
    has_many :recipes
    belongs_to :group
end
