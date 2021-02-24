class User < ApplicationRecord
    has_secure_password
    validates :name, :username, :password, :group, presence: true

    has_many :posts
    has_many :comments
    has_many :recipes
    belongs_to :group
end
