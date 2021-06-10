class Book < ApplicationRecord
  
  belongs_to :category
  belongs_to :company  
  
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :author, presence: true, length: { minimun: 3, maximum: 30 }
  validates :editor, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :company_id, presence: true
  validates :category_id, presence: true
  #books = Book.includes(:company)

end
