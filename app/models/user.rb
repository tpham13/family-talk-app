class User < ApplicationRecord
    has_secure_password

    has_many :updates
    belongs_to :group
end
