class Employee < ApplicationRecord

    acts_as_paranoid

    belongs_to :company
    belongs_to :role
    belongs_to :country
    belongs_to :project

    validates :name, presence: true
    validates :company_id, presence: true
    validates :role_id, presence: true
    validates :country_id, presence: true
    validates :project_id, presence: true

end