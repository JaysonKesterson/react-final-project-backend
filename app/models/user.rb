class User < ApplicationRecord
    has_secure_password
    has_one :store
    has_many :items, through: :store
end
