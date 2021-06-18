class Country < ApplicationRecord

    has_one :employee
    validates :name, presence: true

end
