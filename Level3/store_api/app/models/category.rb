class Category < ApplicationRecord

    has_one :book
    
    validates :name, presence: true
    
end
