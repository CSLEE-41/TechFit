class WorkoutsController < ApplicationController
  
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def create
    @user = User.find([:user_id])
    @workouts = @user.workouts

    # binding.pry

    @workout = current_user.workouts.build(workout_params)
    @workout.user = @user

    if @workout.save
      redirect_to @workout, notice: "New Workout Saved!"
    else 
      flash[:error] = "Error saving your new workout. Please try again."
      render :new
    end
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update_attributes(workout_params)
      redirect_to @workout
    else
      flash[:error] = "Error with update. Please try again."
      render :edit
    end
  end

  def destroy
    @workout = workout.find(params[:id])

    if @workout.destroy
      flash[:notice] = "\"#{@workout.title}\" was deleted successfully."
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
