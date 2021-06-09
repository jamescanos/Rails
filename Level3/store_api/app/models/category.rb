class Category < ApplicationRecord

    #belongs_to :book
    has_one :book
    validates :name, presence: true
    
end
