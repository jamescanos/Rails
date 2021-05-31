class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.float :price
      t.text :description
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :platform, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
