class Item < ApplicationRecord
    belongs_to :store

    validates :name, :price, :condition, :description, presence: true
end
