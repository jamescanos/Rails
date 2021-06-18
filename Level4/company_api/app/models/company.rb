class Company < ApplicationRecord

    has_many :employees, dependent: :destroy
    has_many :clients, dependent: :destroy
    
    validates :name, presence: true

end
