class Game < ApplicationRecord
  
  belongs_to :company
  belongs_to :platform

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :company_id, presence: true
  validates :platform_id, presence: true
  validates :description, presence: true, length: { maximum: 250 }

end
