class User < ApplicationRecord
    has_secure_password
    has_one :store
    has_many :items, through: :stores

    validates :name, :email, presence: true
    validates :email, uniqueness: true
end
