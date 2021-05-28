class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.float :price
      t.text :description
      t.references :company, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
