class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true, length: { minimum: 3 }
end
