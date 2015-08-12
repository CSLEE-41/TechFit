class WorkoutsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @workouts = @user.workouts.all
  end

  def show
    @user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def edit
    @user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @workouts = @user.workouts
    @workout = current_user.workouts.build(workout_params)
    @workout.user = @user

    if @workout.save
      redirect_to user_workouts_path, notice: "New Workout Saved!"
    else 
      flash[:error] = "Error saving your new workout. Please try again."
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])

    if @workout.update_attributes(workout_params)
      redirect_to user_workouts_path
    else
      flash[:error] = "Error with update. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @workout = Workout.find(params[:id])
    

    if @workout.destroy
      flash[:notice] = "\"#{@workout.title}\" was deleted successfully."
      redirect_to user_workouts_path
    else
      flash[:error] = "There was an error deleting the topic. Please try again."
      render :show
    end
  end


  private

  def workout_params
    params.require(:workout).permit(:title, :muscle_group, :body, :day, :notes)
  end
end
