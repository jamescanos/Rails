class Project < ApplicationRecord

    belongs_to :client

    validates :name, presence: true
    validates :client_id, presence: true

end
