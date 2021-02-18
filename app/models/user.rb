class User < ApplicationRecord
    has_secure_password

    has_many :updates
    has_many :recipes
    belongs_to :group
end
