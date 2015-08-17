class NutritionPlan < ActiveRecord::Base
  belongs_to :user




  def calories_remaining
    calories_goal - day_total_calories
  end

  def carbs_remaining
    carbs_goal - day_total_carbs
  end

  def protein_remaining
    protein_goal - day_total_protein
  end

  def fats_remaining
    fats_goal - day_total_fats
  end
end
