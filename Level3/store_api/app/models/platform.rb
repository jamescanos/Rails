class Platform < ApplicationRecord

    has_one :game
    validates :name, presence: true

end