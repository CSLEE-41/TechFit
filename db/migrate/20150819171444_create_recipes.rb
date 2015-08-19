class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :category
      t.text :ingredients
      t.text :instructions
      t.string :food_pic
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
