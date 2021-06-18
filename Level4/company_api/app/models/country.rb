class Country < ApplicationRecord

    #has_one :employees
    validates :name, presence: true

end
