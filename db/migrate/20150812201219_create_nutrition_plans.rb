class CreateNutritionPlans < ActiveRecord::Migration
  def change
    create_table :nutrition_plans do |t|
      t.string :title
      t.date :day
      t.text :meal_plan
      t.text :notes
      t.integer :day_total_calories
      t.integer :day_total_carbs
      t.integer :day_total_protein
      t.integer :day_total_fats
      t.integer :calories_goal
      t.integer :carbs_goal
      t.integer :protein_goal
      t.integer :fats_goal
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
