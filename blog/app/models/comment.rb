class Comment < ApplicationRecord
  
  # includes concerns/visible.rb to avoid duplicate code
  include Visible
  belongs_to :article

end
