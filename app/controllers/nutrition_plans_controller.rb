class NutritionPlansController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @nutrition_plans = @user.nutrition_plans.all
  end

  def show
    @user = User.find(params[:user_id])
    @nutrition_plan = NutritionPlan.find(params[:id])
  end

  def edit
    @nutrition_plan = NutritionPlan.find(params[:id])
  end

  def new
    @nutrition_plan = NutritionPlan.new
  end

  def update
    @user = User.find(params[:user_id])
    @nutrition_plan = NutritionPlan.find(params[:id])

    if @nutrition_plan.update_attributes(nutrition_plan_params)
      redirect_to user_path, notice: "Plan updated."
    else 
      flash[:error] = "Failed to update the nutrition plan. Please try again."
      render :edit
    end
  end

  def create
    @user = User.find(params[:user_id])
    @nutrition_plans = @user.nutrition_plans
    @nutrition_plan = current_user.nutrition_plans.build(nutrition_plan_params)
    @nutrition_plan.user = @user  

    if @nutrition_plan.save
      redirect_to user_path(@user), notice: "New Nutrition Plan Saved!"
    else
      flash[:error] = "Error saving nutrition plan. Please try again."
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @nutrition_plan = NutritionPlan.find(params[:id])

    if @nutrition_plan.destroy
      flash[:notice] = "\"#{@nutrition_plan.title}\" was successfully deleted."
      redirect_to user_path
    else
      flash[:error] = "Failed to delete nutrition plan. Please try again."
      render :show
    end
  end

  private

  def nutrition_plan_params
    params.require(:nutrition_plan).permit(:title, :day, :meal_plan, :notes, :day_total_calories, :day_total_carbs, :day_total_protein, :day_total_fats, :calories_goal, :carbs_goal, :protein_goal, :fats_goal)
  end
end
