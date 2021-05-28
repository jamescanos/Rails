class Book < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true, length: { minimun: 3, maximum: 30 }
  validates :editor, presence: true
  validates :description, presence: true, length: { maximum: 250 }

end
