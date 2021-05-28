class Game < ApplicationRecord

  has_one :platform
  belongs_to :company
  #belongs_to :platform

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  #validates :platform, presence: true
  validates :description, presence: true, length: { maximum: 250 }

end
