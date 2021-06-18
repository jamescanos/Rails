class Client < ApplicationRecord

    has_many :project
    belongs_to :company

    validates :name, presence: true
    validates :company_id, presence: true
    
end
