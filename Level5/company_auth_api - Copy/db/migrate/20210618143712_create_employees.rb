class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :role, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
