class Article < ApplicationRecord
    
    has_many :comments
    
    #validations
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }

end
