class Game < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :platform, presence: true
  validates :description, presence: true, length: { maximum: 250 }


  belongs_to :company, dependent: :destroy
  #belongs_to :platform
  has_one :platform
end
