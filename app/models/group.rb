class Group < ApplicationRecord
    has_many :users
    has_many :recipes
    has_many :posts
end
