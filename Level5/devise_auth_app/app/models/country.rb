class Country < ApplicationRecord

    acts_as_paranoid
    
    has_one :employee
    validates :name, presence: true

end
