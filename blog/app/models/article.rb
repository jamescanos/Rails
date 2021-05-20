class Article < ApplicationRecord
    
    # includes concerns/visible.rb to avoid duplicate code
    include Visible
    # On delete an article, its associated comments will be deleted
    has_many :comments, dependent: :destroy
    
    #validations
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

end
