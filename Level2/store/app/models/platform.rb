class Platform < ApplicationRecord
    #belongs_to :games
    #has_many :games
    validates :name, presence: true
end
