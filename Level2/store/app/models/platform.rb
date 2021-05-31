class Platform < ApplicationRecord

    #belongs_to :game
    has_one :game
    validates :name, presence: true

end
