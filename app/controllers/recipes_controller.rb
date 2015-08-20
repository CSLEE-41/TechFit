class RecipesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
    @recipe = @user.recipes.build(recipe_params)
    @recipe.user = @user 

    if @recipe.save
      redirect_to user_recipes_path, notice: "Recipe was created successfully."
    else
      flash[:error] = "Something went wrong creating your recipe. Please try again.1"
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to user_recipes_path, notice: "Recipe was updated successfully"
    else
      flash[:error] = "There was an error updating your recipe. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy 
      flash[:notice] = "\"#{@recipe.title}\" was successfully deleted."
      redirect_to user_recipes_path
    else
      flash[:error] = "There was an error deleting your recipe. Please try again."
      render :show
    end
  end

  private 
  
  def recipe_params
    params.require(:recipe).permit(:title, :category, :ingredients, :instructions, :food_pic)
  end
end
